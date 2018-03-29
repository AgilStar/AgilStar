/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function getXMLHttpRequest()
	{
	var xhr = null;

	// Firefox et bien d'autres.
	if (window.XMLHttpRequest)
		xhr = new XMLHttpRequest();
	else

	// Internet Explorer.
	if (window.ActiveXObject)
		{
		try	{
			xhr = new ActiveXObject("Msxml2.XMLHTTP");
			}
		catch (e)
			{
			xhr = new ActiveXObject("Microsoft.XMLHTTP");
			}
		}

	// XMLHttpRequest non supporté.
	else
		{
		alert("Votre navigateur ne supporte pas l'objet XmlHttpRequest.");
		xhr = false;
		}

	return xhr;
	}

