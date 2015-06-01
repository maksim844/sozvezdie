function linkWindow(link_url,rparam,height,width) 
{
	/*
	var width = Math.ceil(screen.width/2);
	var height = Math.ceil(screen.height*0.6);
	if (width < 800) { width = 800; }
	if (height < 600) { height = 600; }
	*/
	var left = Math.ceil(screen.width/4);
	var top = Math.ceil(screen.height*0.1);
	var oTarget = window.open(link_url+rparam, "Additional", "height="+height+",width="+width+",scrollbars=1,left="+left+",top="+top);
	oTarget.focus();
	return false;
};