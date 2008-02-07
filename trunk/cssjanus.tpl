<!DOCTYPE html>
<html>
  <head>
    <title>CSS Janus</title>
    <style type="text/css" media="screen, projection">
      @import "http://www.google.com/css/goog.css";
      @import "http://www.google.com/css/gooey.css";
      @import "files/cssjanus.css";
      
      a img {
        border: none;
      }
      .g-doc-1024 {
        padding-top: 2em; 
      }
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
          Basically, this webapp calls cssjanus.py which converts left-to-right-ish properties and values in a CSS file to right-to-left-ish counterparts and vice-versa. See the <a href="http://code.google.com/p/cssjanus/source/browse/trunk/README">README</a> for more details.
        </p>
        
        <p>
          You can also call use this webapp directly in your markup with your publicly accessible CSS files like so for easy testing:
          <pre>
&lt;style type="text/css"&gt;
 @import "/do?file=www.google.com/css/goog.css";
&lt;/style&gt;</pre>
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
            <div>
              <label for="csstext">Paste or Type CSS:</label>
              <textarea id="csstext" name="csstext" rows="5" cols="60" >{% if csstext %}{{ csstext }}{% endif %}</textarea>
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
            
            <div class="g-submit">
              <input type="submit" value="CSSLTRTL-ify me!">
            </div>
          </form>
        </div>
        
        <div class="g-unit">
          {% if result %}
          <form id="results">
            <div>
              <label for="cssresults">Result CSS:</label>
              <textarea id="cssresults" rows="25" cols="60">{{ result }}</textarea>
            </div>
          </form>
          {% endif %}
        </div>
      </div>
    </div>
  </body>
</html>
