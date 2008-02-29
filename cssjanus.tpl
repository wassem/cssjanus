<!DOCTYPE html>
<html>
  <head>
    <title>CSS Janus</title>
    <style type="text/css" media="screen, projection">
      @import "http://www.google.com/css/goog.css";
      @import "http://www.google.com/css/gooey.css";
      @import "files/cssjanus.css";
    </style>
  </head>
  <body>
    <div class="g-doc-1024">
      <div id="hd" class="g-section">
        <h1>
          <a href="/"><img src="files/cssjanus.png" alt="Google CSS Janus"></a>
        </h1>
      </div>
      
      <div class="g-section">
        <h2>CSS Janus Left-To-Right-To-Left-ifyer</h2>
        
        <p>
          This webapp calls cssjanus.py to convert left-to-right-ish properties and values in a CSS file to right-to-left-ish counterparts and vice-versa.
        </p>
        <p>
          See the <a href="http://code.google.com/p/cssjanus/">Project Page on Google Code</a> and the <a href="http://code.google.com/p/cssjanus/source/browse/trunk/README">README</a> for more details. <strong>Author:</strong> <a href="mailto:elsigh@google.com">elsigh@google.com</a> (Lindsey Simon)
        </p>
      </div>
      
      {% if message %}
      <h3 id="cssj-msg">
        {{ message }}
      </h3>
      {% endif %}
      
      <div class="g-section g-tpl-50-50">
        <div class="g-unit g-first">
          <form action="/" method="post">
            <div id="cssj-csstext">
              <label for="csstext">Paste or Type CSS:</label>
              <textarea id="csstext" name="csstext" rows="8" cols="60" >{% if csstext %}{{ csstext }}{% endif %}</textarea>
            </div>
            
            <div>
              <h3>-OR-</h3>
            </div>
            
            <div>
              <label for="cssuri">URI to a CSS file:</label>
              <input id="cssuri" name="cssuri" type="text" size="60" value="{% if cssuri %}{{ cssuri }}{% endif %}">
            </div>
            
            <fieldset>
              <legend>Flags</legend>
              
              <div>
                <label for="swap_ltr_rtl_in_url">
                  <input id="swap_ltr_rtl_in_url" name="swap_ltr_rtl_in_url" type="checkbox" {% if swap_ltr_rtl_in_url %}checked="checked"{% endif %}> --swap_ltr_rtl_in_url
                </label>
              </div>
              
              <div> 
                <label for="swap_left_right_in_url">
                  <input id="swap_left_right_in_url" name="swap_left_right_in_url" type="checkbox" {% if swap_left_right_in_url %}checked="checked"{% endif %}> --swap_left_right_in_url
                </label>
              </div>
            </fieldset>
            
            <div class="cssj-submit">
              <input id="cssj-submit" type="submit" value="Run CSS Janus!">
              <input type="reset" value="Reset">
            </div>
          </form>
        </div>
        
        <div class="g-unit">
          <form id="results">
            <div>
              <label for="cssresults">Result CSS:</label>
              {% if result %}
              <textarea id="cssresults" rows="25" cols="60">{{ result }}</textarea>
              {% else %}
              <em>Results will appear here...</em>
              {% endif %}
            </div>
          </form>
        </div>
      </div>
      
      
      
      <p id="cssj-altuse">
        You could also embed this webapp directly in your markup with your publicly accessible CSS files like so:
        <pre>
&lt;style type="text/css"&gt;
  @import "/do?file=www.google.com/css/goog.css";
&lt;/style&gt;</pre>
      </p>
    </div>
    
    
        
    <script type="text/javascript">
      var exampleText = '.classname-should-not-change-ltr-left-rtl-right {\r' +
                        '  padding: 1px 2px 3px 4px;\r' + 
                        '  margin-right: 3em;\r' +
                        '  background-position: 5% 80%;\r' +
                        '  background: url(testme-bright-cleft-left-ltr.gif);' +
                        ' /* try me with flags */\r' +
                        '  cursor: ne-resize;\r' +
                        '}\r' +
                        '/* @noflip */\r'+
                        '.dontchangeme { float:left }\r' +
                        '.changeme { float:left }';
      var el = document.createElement('span');
      el.id = 'cssj-example';
      el.innerHTML = 'Try this example CSS!';
      el.onclick = function() {
        document.getElementById('csstext').value = exampleText;
      };
      document.getElementById('cssj-csstext').appendChild(el);
    </script>
  </body>
</html>
