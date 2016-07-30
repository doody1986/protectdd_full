<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="protectdd_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<style type="text/css">
    .formSection
{

    cursor:pointer;
    background-color: #b0d1c8;
    font-size: 24px;
    margin-bottom:15px;
    color: #648580; 
    font-family: Helvetica, Verdana, Sans-Serif;
}
.fieldSection
{
    

    position:relative;
    background-color: #649b8c;
    font-size: 30px;
    margin-bottom: 20px;
    color: #d0ebe4;
}
    .formSection a
{

    text-decoration: none;
}
</style>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

    <div class="fieldSection">NOTE: When you have selected a data dictionary to explore please click to expand each area.  You can access down to the field/variable values level (meaning click on the name of the fields/variable to see potential values if there is limit amount of values).<br /><br />If you have any questions please email Shi Dong dong.sh@husky.neu.edu</div>
    <div>
        <div class="formSection"><a href="humanXml.aspx">Human Subject Data Dictionary</a> 
        </div>
        <div class="formSection"><a href="environmentalXML.aspx">Environmental Data Dictionary</a> 
        </div>
        <div class="formSection"><a href="targetedXml.aspx">Targeted Biological Data Dictionary</a>
        </div>
        <div class="formSection"><a href="ultrasoundXml.aspx">Ultrasound Report Data Dictionary</a>
        </div>
        <div class="formSection"><a href="toxicityXml.aspx">Toxicity Report Data Dictionary</a>
        </div>
    </div>
    </form>
</body>
</html>
