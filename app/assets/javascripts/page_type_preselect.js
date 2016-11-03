
function addPageTypePreselect() {


  var elements = document.getElementsByClassName('js-page-type-preselect');

  var index_page_regex = /[A-Z]/
  var content_page_regex = /\d/

  for (var i = elements.length - 1; i >= 0; i--) {

    var element = elements[i];

    element.addEventListener('change', function(event) {

      if (event.target.classList.contains('js-page-number')) {

        var page_number_value = event.target.value.toUpperCase();;
        var page_type = null;

        if (page_number_value.match(index_page_regex)) {
          page_type = "Index";
        } else if (page_number_value.match(content_page_regex)) {
          page_type = "Content"
        }

        if (page_type) {

          var page_type_elements = this.getElementsByClassName('js-page-type')

          for (var k = page_type_elements.length - 1; k >= 0; k--) {

            var page_type_element = page_type_elements[k];

            if (page_type_element.value == '') {
              page_type_element.value = page_type;
            }

          };

        }

      }

    });


  };


}


document.addEventListener('DOMContentLoaded', addPageTypePreselect);