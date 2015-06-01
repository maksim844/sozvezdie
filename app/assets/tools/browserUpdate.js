(function () {
	// browser detection by Peter-Paul Koch, http://www.quirksmode.org/js/detect.html
	var browser, versionSearchString,
		wrapper, notice, closeButton, hoverable,
		item, dataString,
		doc = document,
		vendor = navigator.vendor,
		agent = navigator.userAgent,
		dataBrowser = [
			{string: vendor, subString: 'Apple', identity: 'Safari', latest: '5.1.1'},
			{string: vendor, subString: 'iCab', identity: 'iCab', latest: '4.8'},
			{string: vendor, subString: 'KDE', identity: 'Konqueror', latest: '3.5.8'},
			{string: vendor, subString: 'Camino', identity: 'Camino', latest: '2.0.9'},
			{string: agent, subString: 'OmniWeb', versionSearch: 'OmniWeb', identity: 'OmniWeb', latest: '5.11'},
			{string: agent, subString: 'Firefox', identity: 'Firefox', latest: '7.0.1'},
			{string: agent, subString: 'MSIE', identity: 'Explorer', versionSearch: 'MSIE', latest: '7.0'}
		];
 
	if (window.opera) {
		versionSearchString = agent.match(/Version/) ? 'Version' : 'Opera';
		browser = {version: searchVersion(agent), identity: 'Opera', latest: '11.51'};
	} else {
		for (var i = 0; i < dataBrowser.length; i++) {
			item = dataBrowser[i];
			dataString = item.string;
			if (dataString && dataString.indexOf(item.subString) != -1) {
				browser = item;
				versionSearchString = item.versionSearch || item.identity;
				browser.version = searchVersion(agent) || searchVersion(navigator.appVersion);
				break;
			}
		}
	}
	
	if (!window.browserUpdateShowExample) {
		if (!browser || (doc.cookie && doc.cookie.indexOf('noBrowserUpdate=1') > -1)) return;
		var current = browser.version.split(/\./),
			latest  = browser.latest.split(/\./),
			good = true;
		for (var index = 0; index < latest.length; ++index) {
			if (current.length < index + 1) { good = false; break; }
			if (parseInt(current[index]) < parseInt(latest[index])) { good = false; break; }
		}

		if (good) return;
	}
 
	function searchVersion(dataString) {
			var index = dataString.indexOf(versionSearchString);
			if (index == -1) return; 
			return dataString.substring(index + versionSearchString.length + 1).match(/[\d\.]+/)[0];
	};
		
	wrapper = doc.createElement('div');
	notice = doc.createElement('div');
	closeButton = doc.createElement('span');
	
	hoverable = true;
 
	closeButton.style.cssText = 'position: absolute; top: -1px; right: 3px; margin: 0; padding: 0; font-family: arial, sans sefif; font-weight: bold; font-size: 19px; color: black; cursor: default';
	notice.style.cssText = 'margin: 0; padding: 0; height: 100%; margin-top: 3px; padding-left: 23px; font-family: verdana, sans sefif; font-size: 11px; color: black; background-repeat: no-repeat; overflow: hidden; background-position: 0 -3px; z-index: 32000';
	notice.style.backgroundImage = (browser.identity == 'Explorer') ? 'url(http://arty.name/browser-update/shield.png)' : 'url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAVCAYAAABc6S4mAAAAAXNSR0IArs4c6QAAAAZiS0dEAP8A/wDhWrKa8AAAAAlwSFlzAAALEwAACxMBAJqcGAAAAAd0SU1FB9gGHQkTG/vR/fEAAAKySURBVDjL7ZRbSJNhHMZ/32F9m27ObTG3ikpL0zYi2MoOFNlFJQgFFQQRdLrtcNOV990EYkRQCYl5URAVVFRkFB2IDlDZwTTScrpa8zAn29zad+hiXYUrh11Fz+X//b/Py/M8Lw/8xx8gTG2t0gXSJtAduTvCMAhXoTs5zQcqXWD3gVoO1SGoieXm7x3QNR9MfRB+C5GRfAzy5OMFPjAFwbBC8AXwgSVbapkVqCQ1UM2X8kE+ek5CWoLEDrCPgvoaet9NUUH5Qdj1ECSDwNqVFK3ODt8wtbisudN7Tzm+ftuVLHLXYj5rjaAJ0F4Hn5p+ZRLzKJNA0dlyePeRQ+v2kR7wRr7RLtS83Cr4Q9vrajlEKnAZd72PCs8ZkAwwhAIsAlAFUkn9WFvmEWrvMv/WV2UkJi6hKOF4fO4dpNIJ9KiEvdoNkbwseRQIBsgGmTGVZHgOqF40eQGSGaSSJrudACUdO0GXyY6Zf/dN8lmkgmSQHJfQk2WI2UrGsy6stia1c8NSoaq1BdvMvaiZ7wh65idVphCLIqAJfI/NZobVgYEdm8Kqmg1X5IUXPHirWlHlUYykgFSkQtQMDOUJczI4nGDYsSgerJ460ExogjAQ6/FTXLoGTZFATKMoEunQC4YevIFoHOL9U7WoG3pm8Tl1DklTEE0pLKbhzcsbGhmZ34hoSaAUgazJ9IdOQMgNxusCMugbhqQJZINwRzNKcQRRmbh4io6eRxVHMTu7sZksfHlwjUQmDikdQrECq8JbAub9sPsu/qIDlK1YSFx0YGRLcXo0eq/doi91GtrWwcRZ+DpeQAYAiQzY49BZT9R3nk+P7xMMVmB22bjdvIeY+Qm0bgT9JgwOTqNN5y0GsQFWPoNFY7nZOyc8D4J+Hfq7/kJdz3GDXA+iN1cJwgBwK5fVv44fpOnvlMI2viUAAAAASUVORK5CYII=)';
	wrapper.style.cssText = 'position: absolute; top: 0px; height: 20px; left: 0px; width: 100%; margin: 0; padding: 0; background: #ffffe1; border: 0; border-bottom: 2px solid #808080; z-index: 32000';
	if (browser.identity == 'Explorer') {
		notice.style.backgroundPosition = '5px 0';
	}
 
	wrapper.appendChild(notice);
	wrapper.appendChild(closeButton);
	notice.appendChild(doc.createTextNode('Вы используете устаревшую версию ' + browser.identity + '! Щёлкните эту надпись для дополнительной информации...'));
	closeButton.appendChild(doc.createTextNode('\u00D7'));
	
	closeButton.onclick = function(event){
		doc.body.removeChild(wrapper);
		doc.body.parentNode.style.marginTop = '';
		var now = new Date();
		now.setDate(now.getDate() + 7);
		doc.cookie = 'noBrowserUpdate=1;expires=' + now.toGMTString();
	};
	
	function hover(state) {
		if (!hoverable) return;
		wrapper.style.backgroundColor = state ? '#0a246a' : '#ffffe1';
		notice.style.color = state ? 'white' : 'black';
		closeButton.style.color = state ? 'white' : 'black';
	};
	function showInfo() {
		if (!hoverable) return;
 
		hover(false);
		hoverable = false;
 
		var updateLink = {
			Explorer: 'http://www.microsoft.com/rus/windows/downloads/ie/getitnow.mspx',
			Opera: 'http://ru.opera.com/download/thanks/',
			Safari: 'http://apple.com/safari/',
			Firefox: 'http://fx.yandex.ru/',
			iCab: 'http://www.icab.de/dl.php',
			Konqueror: 'http://www.konqueror.org/download',
			Camino: 'http://caminobrowser.org/download/releases/',
			OmniWeb: 'http://www.omnigroup.com/applications/omniweb/download/'
		}[browser.identity];
 
		notice.innerHTML = 'Вы используете устаревшую версию ' + browser.identity + '. Это значит, что ваш компьютер и ваши личные данные в опасности. Установите новую версию, чтобы защитить себя и раскрыть весь потенциал сайтов, которые вы посещаете!<a style="display: block; width: 100%; text-align: center; font-size: large;" target="_blank" href="' + updateLink + '">Обновить браузер</a>';
		notice.style.backgroundImage = '';
		wrapper.style.cssText = 'position: absolute; top: 100px; height: auto; left: 30%; width: 40%; margin: 0; padding: 1em; padding-right: 1.5em; background: #ffffe1; border: 1px solid #808080; z-index: 30000';
	};
	
	if (wrapper.addEventListener) {
		wrapper.addEventListener('mouseover', function(){ hover(true) }, false);
		wrapper.addEventListener('mouseout',  function(){ hover(false) }, false);
		notice.addEventListener('click', showInfo, false);
	} else {
		wrapper.attachEvent('onmouseenter', function(){ hover(true) });
		wrapper.attachEvent('onmouseleave', function(){ hover(false) });
		notice.attachEvent('onclick', showInfo);
	}
	
	doc.body.appendChild(wrapper);
})();
