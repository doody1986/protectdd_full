<%@ Page Language="C#" AutoEventWireup="true" CodeFile="humanXml.aspx.cs" Inherits="protectdd_humanXml" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<style type="text/css">
body 
{
    font-family: Helvetica, Verdana, Sans-Serif;
    margin: 0px;
    padding: 0px;
}

.formSection
{
    display:none;
    cursor:pointer;
    background-color: #b0d1c8;
    font-size: 24px;
    margin-bottom:15px;
    color: #648580; 
}


.sectionSection
{
    
    display:none;
    position:relative;
    left: 25px;
    background-color: #81b1a4;
    font-size: 20px;
    margin-bottom:15px;
    color: #648580;
}

.fieldSection
{
    
    display:none;
    position:relative;
    left: 50px;
    background-color: #649b8c;
    font-size: 16px;
    margin-bottom:15px;
    color: #d0ebe4;
}

.fieldValueSection
{
    
    display:none;
    position:relative;
    left: 75px;
    background-color: #407265;
    font-size: 12px;
    padding: 3px;
    color:#ffffff;
}

.fieldLabel
{
color: #F4E69F;
}
.fieldType
{
    float:left;
    width: 200px;
    font-size: 14px;
}
.fieldConstraints
{
    float:left;
    width: 200px;
    font-size: 14px;
}

.fieldNotes
{
    float:left;
    width: 400px;
    font-size: 14px;
}

.fieldBranchingLogic
{
    float:left;
    width: 400px;
    font-size: 14px;
}

.fix
{
    height: 1px;
    clear:both;
}


</style>
    <script src="JScript.js" type="text/javascript"></script>
    <script type="text/javascript">

        var language = "English";
        var defaultLabel = "UNLABELED";

        function languageChange() {
            $(".formSection").fadeOut(100);
            $("#loader").fadeIn(200);
            $(".main").empty();
            language = $('input[name=languageChoice]:checked', '#form1').val()
            getXML();
        }

        $(document).ready(function () {
            $.ajax({
                type: "GET",
                url: "humandd.xml",
                dataType: "xml",
                success: xmlParser
            });
        });

        function getXML() {

            $.ajax({
                type: "GET",
                url: "humandd.xml",
                dataType: "xml",
                success: xmlParser
            });

        }

        function xmlParser(xml) {
            
            var constructionString = "";

            $(xml).find("form").each(function () {

                constructionString += '<div class="formSection">' + 
                                      $(this).find("formLabel" + language).text();

                $(this).find("sections").each(function () {

                    $(this).find("section").each(function () {

                        var sectionLabelText = "";

                        if ($(this).find("sectionLabel" + language).text() == "") {

                            sectionLabeledText = defaultLabel;

                        } else {

                            sectionLabeledText = $(this).find("sectionLabel" + language).text();

                        }


                        constructionString += '<div class="sectionSection">' + 
                                              sectionLabeledText;

                        $(this).find("fields").each(function () {

                            $(this).find("field").each(function () {

                                var constraint = "";
                                var notes = "";
                                var branchlogic = "";

                                if($(this).find("fieldConstraints").text() != "") {

                                    constraint = "Constraint: " + $(this).find("fieldConstraints").text();

                                }

                                if ($(this).find("fieldNote" + language).text() != "") {

                                    notes = "Notes: " + $(this).find("fieldNote" + language).text();

                                }

                                if  ($(this).find("fieldBranchingLogic").text() != "") {

                                    branchlogic = "Branching logic: Only when " +
                                                  $(this).find("fieldBranchingLogic").text() +
                                                  " can this field be not NULL";

                                }

                                constructionString += '<div class="fieldSection"><div class="fieldName"><span class="fieldLabel">(' +
                                                      $(this).find("fieldName").text() +
                                                      ')</span> ' +
                                                      $(this).find("fieldLabel" + language).text() +
                                                      '</div><hr /><div class="fieldType">Data Type: ' +
                                                      $(this).find("fieldType").text() +
                                                      '</div><div class="fieldConstraints">' +
                                                      constraint +
                                                      '</div><div class="fieldNotes">' +
                                                      notes +
                                                      '</div><div class="fieldBranchingLogic">' +
                                                      branchlogic +
                                                      '</div><div class="fix">&nbsp;</div>';

                                $(this).find("fieldValues").each(function () {

                                    $(this).find("fieldData").each(function () {

                                        constructionString += '<div class="fieldValueSection">(' +
                                                              $(this).find("fieldValue").text() +
                                                              ') ' +
                                                              $(this).find("fieldValueLabel"+language).text() +
                                                              '</div>';

                                    });
                                });

                                constructionString += '</div>';
                            });
                        });
                        constructionString += '</div>';
                    });

                });

                constructionString += '</div>';

            });


                $('#loader').fadeOut(2500);
                $(".main").append(constructionString);
                $(".formSection").fadeIn(1500);

                attachEvents();  
        } 
         
        function attachEvents() {

            $(".formSection").click(function (e) {
                if ($(this).children(".sectionSection").css("display") != "none") {
                    $(this).children(".sectionSection").hide(200);
                } else {
                    $(this).children(".sectionSection").show(200);
                }
                e.stopPropagation();
            });

            $(".sectionSection").click(function (e) {
                if ($(this).children(".fieldSection").css("display") != "none") {
                    $(this).children(".fieldSection").hide(200);
                } else {
                    $(this).children(".fieldSection").show(200);
                }
                e.stopPropagation();
            });

            $(".fieldSection").click(function (e) {
                if ($(this).children(".fieldValueSection").css("display") != "none") {
                    $(this).children(".fieldValueSection").hide(200);
                } else {
                    $(this).children(".fieldValueSection").show(200);
                }
                e.stopPropagation();
            });
        }

    </script>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>   
            <div >
                <input type="radio" name="languageChoice" onchange="languageChange()" value="English" checked="checked"/>English<br />
                <input type="radio" name="languageChoice" onchange="languageChange()" value="Spanish"/>Spanish
            </div>
            <div align="center" id="loader">
                <img src="loader.png" id="load" width="300" height="300" style="position:absolute;z-index:300;left:50%" alt="Loading.."/>
            </div>
            <div class="main">
                    
            </div>
 
            <div class="clear"></div>

    </div>
    </form>

</body>

</html>
