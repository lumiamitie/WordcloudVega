HTMLWidgets.widget({

  name: "simple_wordcloud",
  type: "output",

  factory: function(el, width, height) {

    var generate_spec = function(data) {

      var spec = {
          "name": "wordcloud",
          "width": 700,
          "height": 565,
          "padding": 5,
          "autosize": "fit",

          "data": [
            {
              "name": "table",
              "values": data,
              "transform": [
                {
                  "type": "wordcloud",
                  "size": [{"signal": "width"}, {"signal": "height"}],
                  "text": {"field": "keyword"},
                  "font": "sans-serif",
                  "fontSize": 25,
                  "padding": 1
                }
              ]
            }
          ],

          "scales": [
            {
              "name": "color",
              "type": "ordinal",
              "range": {"scheme": "dark2"}
            }
          ],

          "marks": [
            {
              "type": "text",
              "from": {"data": "table"},
              "encode": {
                "enter": {
                  "x": {"field": "x"},
                  "y": {"field": "y"},
                  "angle": {"field": "angle"},
                  "font": {"field": "font"},
                  "fontSize": {"field": "fontSize"},
                  "fontStyle": {"field": "fontStyle"},
                  "text": {"field": "keyword"},
                  "align": {"value": "center"},
                  "baseline": {"value": "alphabetic"},
                  "fill": {"scale": "color", "field": "keyword"}
                },
                "update": {
                  "fillOpacity": {"value": 1}
                },
                "hover": {
                  "fillOpacity": {"value": 0.5}
                }
              }

            }
          ]
        };

      return spec;
    };

    return {
      renderValue: function(x) {

        var spec = generate_spec(HTMLWidgets.dataframeToD3(x.data));
        var embed_opt = {"actions": false};
        vegaEmbed('#'+el.id, spec, embed_opt);

      },

      resize: function(width, height) { }
    };


  }

});
