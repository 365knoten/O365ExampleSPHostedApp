'use strict';


// Helper Function
function getQueryStringParameter(paramToRetrieve) {
    var params = document.URL.split("?")[1].split("&");
    var strParams = "";
    for (var i = 0; i < params.length; i = i + 1) {
        var singleParam = params[i].split("=");
        if (singleParam[0] == paramToRetrieve) {
            return singleParam[1];
        }
    }
    return null;
}




ExecuteOrDelayUntilScriptLoaded(initializePage, "sp.js");

function initializePage()
{

    var items = null;

    $(document).ready(function () {

        console.log("Loading Data from Hostweb");

        var hostWebURL = decodeURIComponent(getQueryStringParameter("SPHostUrl"));

        var context = SP.ClientContext.get_current();
        var hostWebContext = new SP.AppContextSite(context, hostWebURL);
        var list = hostWebContext.get_web().get_lists().getByTitle('Apps im Test');


        var camlQuery = new SP.CamlQuery();
        items = list.getItems(camlQuery);

        context.load(items);
        context.executeQueryAsync(function () {
            var listItemEnumerator = items.getEnumerator();
            var html="<ul>"
            while (listItemEnumerator.moveNext()) {
                var item = listItemEnumerator.get_current();
                    html += "<li>" + item.get_item('AppName') + "</li>";
                    console.log(item.get_item('AppName'))
            }
            html += "</ul>"
            document.getElementById("message").innerHTML = html;

        }, function () { });


    });


    
}
