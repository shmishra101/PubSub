<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="css/master.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <title>Code Editor</title>
  </head>

  <body onload="loadCode();">
    <div class="container-fluid">
      <div class="jumbotron text-center">
        <h1>Code Editor</h1>
        <p>Coding is fun!</p>
      </div>
    </div>

    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-6">
          <div class="well">
            <form action="result.jsp" method="post">
              <div>
                <label>Code Editor:</label>
                <textarea class="form-control" id="codePage" name="codeText" rows="25"></textarea>
              </div>
              <br>
              <div>
                <button class="btn btn-success" type="submit" id="submitBtn">Compile & Run</button>
              </div>
            </form>
          </div>
        </div>
        <div class="col-sm-6">
          <div class="well">
            <div class="">
              <label>Output:</label>
              <textarea class="form-control" id="resultPage" name="resultText" rows="25" readonly></textarea>
            </div>
            <br>
            <div>
              <button class="btn btn-info" type="button" id="clearBtn">Clear</button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>

  <script type="text/javascript">

    var btn = document.getElementById('clearBtn');
    var resultBox = document.getElementById('resultPage');

    btn.onclick = function() {
      resultBox.value = '';
    }

    function loadCode() {
      var codeBox = document.getElementById("codePage");
      var text="class Test "+"\n"+"{"+"\n\t"+"public static void main(String args[])"+"\n\t"+"{"+"\n\n\n\n\n\n\n"+"\t}"+"\n"+"}";
      codeBox.value=text;
    }

  </script>

</html>
    