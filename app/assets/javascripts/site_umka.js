jQuery(document).ready(function(){

	jQuery(".leftmenu ul li a.active").wrap("<span class='bo' />").before("<span class='bl'></span><span class='bm'></span><span class='br'></span>");
	jQuery("ul.leftmenu2  li a.active").wrap("<span class='bo' />").before("<span class='bl'></span><span class='bm'></span><span class='br'></span>");
	jQuery("div.smallimg  img").wrap("<span class='bo' />").after("<span class='bl'></span><span class='tr'></span>");
	jQuery(".item").prepend("<span class='comt'></span><span class='comm'></span><span class='comb'></span>");
	jQuery(".teachersimg").prepend("<span class='teachersbg'></span>");

});