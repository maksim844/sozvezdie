function checkIfFlashEnabled() { 
   var isFlashEnabled = false; 
   // �������� ��� ���� ���������, ����� IE 
   if (typeof(navigator.plugins)!="undefined" 
       && typeof(navigator.plugins["Shockwave Flash"])=="object" 
   ) { 
      isFlashEnabled = true; 
   } else if (typeof  window.ActiveXObject !=  "undefined") { 
      // �������� ��� IE 
      try { 
         if (new ActiveXObject("ShockwaveFlash.ShockwaveFlash")) { 
            isFlashEnabled = true; 
         } 
      } catch(e) {}; 
   }; 
  
   return isFlashEnabled; 
}
function GetFlash(flash) { 

var flag=checkIfFlashEnabled();
if(flag)
{
document.write('<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" width="133" height="133" id="flashLogo" align="middle"><param name="movie" value="'+flash+'" /><param name="quality" value="high" /><param name="play" value="true" /><param name="loop" value="true" /><param name="wmode" value="transparent" /><param name="scale" value="showall" /><param name="menu" value="true" /><param name="devicefont" value="false" /><param name="salign" value="" /><param name="allowScriptAccess" value="sameDomain" /><!--[if !IE]>-->		<object type="application/x-shockwave-flash" data="'+flash+'" width="133" height="133"><param name="movie" value="'+flash+'" /><param name="quality" value="high" /><param name="play" value="true" /><param name="loop" value="true" /><param name="wmode" value="transparent" /><param name="scale" value="showall" /><param name="menu" value="true" /><param name="devicefont" value="false" /><param name="salign" value="" /><param name="allowScriptAccess" value="sameDomain" /><!--<![endif]--><a href="http://www.adobe.com/go/getflash"><img src="http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif" alt="Get Adobe Flash player" /></a><!--[if !IE]>--></object><!--<![endif]--></object>'); 
}

else
{
document.write('<img src="/assets/logo2.png" border=0>');
}

}