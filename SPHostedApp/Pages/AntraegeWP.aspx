<%@ Page Language="C#" Inherits="Microsoft.SharePoint.WebPartPages.WebPartPage, Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>

<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>

<WebPartPages:AllowFraming ID="AllowFraming" runat="server" />

<html>
<head>
    <title></title>

    <script type="text/javascript" src="../Scripts/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="/_layouts/15/MicrosoftAjax.js"></script>
    <script type="text/javascript" src="/_layouts/15/sp.runtime.js"></script>
    <script type="text/javascript" src="/_layouts/15/sp.js"></script>

    <script type="text/javascript">



        // Automatically Resize the Iframe to match the space in SharePoint
        $(document).ready(function () {
            try {
                window.parent.postMessage('resize(100%,' + ($(document).height()) + ')', '*');
            } catch (err) {
                //alert(err);
            }
        });




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


         // Get Parameter and set background color to the value
        $(document).ready(function () {           
            var color = decodeURIComponent(getQueryStringParameter("Color"));
            document.getElementById("bacon").style.backgroundColor = color;
        });



    </script>
</head>
<body>
    <div id="bacon">
        Bacon ipsum dolor amet beef ribs landjaeger cupim beef tongue porchetta sirloin picanha ribeye pork. Ham cow ham hock drumstick tail. Spare ribs filet mignon ball tip, pancetta biltong salami capicola cow porchetta leberkas ham hock pork loin. Shank brisket bacon, capicola tenderloin picanha short ribs drumstick swine pig sirloin fatback pork beef ribs.
        Tri-tip ball tip drumstick beef bacon, chuck cow prosciutto tongue spare ribs venison ham hock short ribs. Landjaeger ham hock burgdoggen, corned beef pancetta swine t-bone beef ribs flank frankfurter pork tenderloin jerky. Cupim prosciutto filet mignon pancetta, burgdoggen cow beef leberkas alcatra capicola tongue ribeye. Salami frankfurter bresaola porchetta corned beef picanha. Beef chuck pancetta, pastrami frankfurter filet mignon fatback.
    </div>



</body>
</html>
