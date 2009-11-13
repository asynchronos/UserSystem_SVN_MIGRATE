<%@ Page Language="C#" AutoEventWireup="false" CodeFile="IframeLoader.aspx.cs" Inherits="aspx.IframeLoader" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Iframe Loader</title>
        <script type="text/javascript">
            var url = "#";
            function init() {
                if (this.url) {
                    location.href = this.url;
                }
            }
        </script>
        
        <%
            String url = String.Empty;
        
            if (this.hasQueryString("url"))
            {
                url = this.getQueryString("url");
            }
            
            Response.Write("<script type=\"text/javascript\">\n");
            Response.Write("<!--\n");
            Response.Write("this.url = decodeURIComponent('" + url + "');\n");
            Response.Write("//-->\n");
            Response.Write("</script>\n");
        %>
        
        <style type="text/css">
            .loadingStyle
            {
	            position: absolute;
	            left: 45%;
	            top: 40%;
	            background-image: url(./images/progress/cicle/indicator_verybig.gif);
	            background-repeat: no-repeat;
	            text-align: center;
	            vertical-align: middle;
	            z-index: 99999;
	            width: 128px;
	            height: 128px;
            }
        </style>  
    </head>
    <body onload="init();" style="overflow:hidden;">
        <form id="form1" runat="server">
            <div class="loadingStyle">
                
            </div>
        </form>
    </body>

    <script type="text/javascript">
        if (document.layers) {
            document.write('<Layer src="' + this.url + '" visibility="hide"></Layer>');
        }
        else if (document.all || document.getElementById) {
            document.write('<iframe src="' + this.url + '" style="visibility:hidden;"></iframe>');
        }
        else {
            init();
        }
    </script>
</html>
