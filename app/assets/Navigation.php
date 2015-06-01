<?
Cubique::AttachModule('ASkinable');
Cubique::LoadPackage('JQuery');
Cubique::LoadPackage('Html');

/**
 * Идеально подходит для построения навигации, меню,
 * деревьев и других вложенных списковых структур
 * 
 * Вывод полностью настраивается при помощи декораторов $navInstance->Decorators
 * Для сложной верстки возможно придется писать классы Html-декораторов
 */
class Navigation extends ASkinable implements IHaveResources 
{
	/**
	 * Здесь храняцо вся ссылочки иерархично
	 * @var SWEList
	 */
	protected $links;
	/**
	 * Здесь хранитсявся структура построения навигации
	 * иерархия соблюдается. Первый элемент в списке используется
	 * для первого уровня декораторов, второй для второго и т.д.
	 * Если количество уровней в иерархии больше, чем количество декораторов в 
	 * списке, то для всех "лишних" будет браться последний декоратор
	 * @var SWEList
	 */
	protected $decorators;
	/*
	 * Тема, которую будет использовать навигация,
	 * по умолчанию Basic
	 * var @string
	 */
	public $Theme;
	/**
	 * Click, Hover
	 * @var string
	 */
	public $Mode;
	/**
	 * Использовать JavaScript для того,
	 * чтобы скрывать вложенные элементы
	 * @var bool
	 */
	public $HideChildren;
	/**
	 * Открывать текущий элемент
	 * @var bool
	 */
	public $OpenCurrent;
	/**
	 * Декоратор для ссылок (по-умолчанию HtmlA)
	 * @var IHtmlTag
	 */
	public $LinkDecorator;
	/**
	 * Декоратор, используемый для нессылочных элементов (по-умолчанию HtmlSpan)
	 * @var IHtmlTag
	 */
	public $NonLinkDecorator;
	/**
	 * Декоратор для закрывающего меню элемента
	 * @var IHtmlTag
	 */
	public $ClickCloseDecorator;
	/**
	 * Декоратор для закрывающего меню элемента
	 * @var IHtmlTag
	 */
	public $ClickOpenDecorator;
	
	public function __construct()
	{
		parent::__construct();
		$this->Theme = 'Basic';
		$this->Mode = 'Click';
		$this->HideChildren = true;
		$this->decorators = new SWEList('NavItemStruct');
		$this->links = new SWEList('NavItem');
		$this->decorators->Add(new NavItemStruct(new HtmlUl(), new HtmlLi()));
		$this->OpenCurrent = false;
		$this->ClickCloseDecorator = '-';
		$this->ClickOpenDecorator = '+';
	}

	public function Run()
	{
		parent::Run();
		if($this->HideChildren)
		{
			$this->GetJs();
		}
		return $this->ProcessRow($this->links->Items);
	}
	
	protected function GetJs()
	{
		$params = array(
			'Mode' => $this->Mode,
			'ClickCloseDecorator' => $this->ClickCloseDecorator,
			'ClickOpenDecorator' => $this->ClickOpenDecorator,
			'TagNames' => $this->GetTagNames(),
			'Id' => $this->GetPrefix(),
			'Prefix' => $this->GetPrefix()
		);
		$this->resources[] = Cubique::UseEmbed( Cubique::GetFolder('MODULES') . '/standard/Navigation/resources/Navigation.js', $params, 'js');
	}
	
	protected function GetTagNames()
	{
		$TagNames = array();
		foreach($this->decorators->Items as &$value)
		{
			if( $value->Item instanceof HtmlTag)
				$TagNames[] = $value->Item->GetTagName();
			else
			{
				if($value->Item['Normal'] instanceof HtmlTag)	
					$TagNames[] = $value->Item['Normal']->GetTagName();
				
				if($value->Item['Current'] instanceof HtmlTag &&
					($tmp = $value->Item['Current']->GetTagName) != $TagNames[sizeof($TagNames) - 1])
					$TagNames[] = $tmp;
			}
		}
		$Id = $this->GetPrefix();
		$TagNames = json_encode($TagNames);
		return $TagNames;
	}
	
	protected function ProcessRow(array $NavItems, $Depth = 0, $BeginCount = 0)
	{
		if($this->links->Count == 0 ) return '';
		$struct = $this->GetDecorator($Depth);
		$childrenCount = 0;
		$current = false;
		$children = array();
		
		foreach($NavItems as &$value)
		{
			// decorators
			$key = $value->IsCurrent ? 'Current' : 'Normal';
			$decorator = clone $struct->Item[$key];
			$decorator->id = $this->GetPrefix() . 'Item' . $Depth;
			$decorator->AddClass($decorator->id);
			
			if($value->Uri && !$value->IsCurrent)
			{
				$iDecorator = $this->LinkDecorator instanceof HtmlA ? clone $this->LinkDecorator : 
					new HtmlA();
				$iDecorator->href = $value->Uri;
			}
			else
			{
				$iDecorator = $this->NonLinkDecorator instanceof HtmlTag ? clone $this->NonLinkDecorator :
					new HtmlSpan();
					
				if($value->IsCurrent)
				{
					$iDecorator->AddClass('Current');
					$current = true;
				}
			}
				
			$iDecorator->Value = $value->Title;
			$decorator->Value = $iDecorator;
			$decorator->id .= $BeginCount++;

			if($value->Children->Count)
			{
				$childContainer = $this->ProcessRow($value->Children->Items, $Depth + 1, $childrenCount);
				$childrenCount += $childContainer->Children->Count;
				$iDecorator->AddClass('HaveChildren');
				$decorator->Children->Add($childContainer);
			}
			
			$children[] = $decorator;
			
			// separator
			$separator = NULL;
			if($struct->Item['Separator'])
			{
				$separator = $struct->Item['Separator'] instanceof HtmlTag ? 
					clone $struct->Item['Separator'] :
					new HtmlContainer($struct->Item['Separator'] );
				$children[] = $separator;
			}
			
			if($value->IsCurrent)
			{
				//$current = true;
				//var_dump($value->Title);
			}	
		}
		
		if($struct->Item['Separator'])
		{
			array_pop($children);
		}
		
		
		$key = $current ? 'Current' : 'Normal';
		$container = clone $struct->Container[$key];
		$container->AddClass($this->GetPrefix() . 'Container' . $Depth);
		$container->Children->AddRange($children);
		
		if($current = 'Current')
		{
			//echo $container;
		}
		
		return $container;
	}

	/**
	 * @param int $Depth
	 * @return NavItemStruct
	 */
	protected function GetDecorator($Depth)
	{
		$wasDepth = $Depth;
		if(!$this->decorators->Items[0])
		{
			$this->decorators->Add(new NavItemStruct(new HtmlUl(), new HtmlLi()));
		}
		while(! array_key_exists('$Depth', $this->decorators->Items) && $Depth >= 0 )
		{
			$Depth--;
		}
			
		if($Depth < 0)$Depth = 0;
			
		$decorator = $this->decorators->Items[$Depth];
		$decorator = $this->PrepareDecoratorStruct($decorator);
		
		$decorator = clone $decorator;
		return $decorator;
	}
	
	protected function PrepareDecoratorStruct(NavItemStruct $decorator, $Recursion = false)
	{
		if(!is_array($decorator->Container))
		{
			$decorator->Container = array(
				'Current' => $decorator->Container,
				'Normal' => $decorator->Container,
				'Separator' => $decorator->ContainerSeparator);
		}
		if(!is_array($decorator->Item))
		{
			$decorator->Item = array(
				'Current' => $decorator->Item,
				'Normal' => $decorator->Item,
				'Separator' => $decorator->ItemSeparator);
		}
		
		if(
			!$Recursion && (
			!($decorator->Container['Current'] instanceof HtmlTag) || 
			!($decorator->Item['Current'] instanceof HtmlTag) ||
			!($decorator->Container['Normal'] instanceof HtmlTag) || 
			!($decorator->Item['Normal'] instanceof HtmlTag)))
		{
			$newDecorator = new NavItemStruct(new HtmlUl(), new HtmlLi(), $decorator->Separator);
			$this->decorators->Replace($decorator, $newDecorator);
			$decorator = $newDecorator;
			$this->PrepareDecoratorStruct($decorator, true);
		}
		return $decorator;
	}
	
	public function __get($Property)
	{
		switch($Property)
		{
			case 'Links': return $this->links;
			case 'Decorators': return $this->decorators;
		}
	}
}

/**
 * Важно, то, что можно задавать декораторами как просто теги, так и
 * хеш-массивы для текущего и обычного элементов.
 * Однако, лучше, если верстальщик будет верстать все с помощью ul и li и
 * с использованием каскадных стилей вида ul li ul li{}. Как показывает
 * практика в 99% так сверстать можно 
 */
class NavItemStruct
{
	/**
	 * Декоратор для контейнера
	 * @var mixed - array("Normal" => IHtmlTag, "Current" => IHtmlTag)|IHtmlTag
	 */
	public $Container;
	/**
	 * Декоратор для элемента
	 * @var mixed - array("Normal" => IHtmlTag, "Current" => IHtmlTag)|IHtmlTag
	 */
	public $Item;
	/**
	 * Разделитель
	 * @var IHtmlTag
	 */
	public $Separator;
	
	public function __construct($Container, $Item, $Separator = NULL)
	{
		$this->Container = $Container;
		$this->Item = $Item;
		$this->Separator = $Separator;
	}
	
	public function __clone()
	{
		if(is_object($this->Container))
		$this->Container = clone $this->Container;
		
		if(is_object($this->Item))
		$this->Item = clone $this->Item;	
	}
}

class NavItem
{
	public $Title;
	public $IsCurrent;
	/**
	 * @var SWEUri
	 */
	public $Uri;
	/**
	 * @var SWEList
	 */
	protected $children;

	public function __construct($Title = NULL, $Uri = NULL, array $Children = NULL, $IsCurrent = false)
	{
		if(($Uri instanceof SWEUri))
		{
			//$Uri = $Uri; 
		}
		elseif($Uri === false)
		{
			$Uri = NULL;
		}
		elseif(is_string($Uri))
		{
			$Uri = SWEUri::Parse($Uri);
		}
		else
		{
  		//$Uri = Cubique::GetRouter()->GetBaseUri(false);			
		}
		$this->Uri = $Uri;
		$this->Title = $Title ? $Title : $Uri->__toString();
			
		$this->children = new SWEList('NavItem');
		if(is_array($Children))
		{
			$this->children->AddRange($Children);
		}
		if(!$IsCurrent)
		{
			$uri = SWEUri::GetCurrent();
			$uri->ClearGetVars();
			if("$Uri" == "$uri")
			{
				$IsCurrent = true;
			}
			elseif($Uri->GetLastPart() == 'index')
			{
				$_uri = clone $Uri;
				$_uri->Remove();
				if("$_uri" == "$uri")
				{
					$IsCurrent = true;
				}
			}else{
				while($uri->GetLength()>0){
					$uri->Remove();
					if("$Uri" == "$uri"){
						$IsCurrent = true;
						break;
					}
				} 
			}
		}
		
		$this->IsCurrent = $IsCurrent;
	}
	
	public function __get($Property)
	{
		switch($Property)
		{
			case 'Children': return $this->children;
		}
	}
	
	public function __clone()
	{
		$this->children = clone $this->children;
		if($this->Uri instanceof SWEUri)
			$this->Uri = clone $this->Uri;
	}
}
?>