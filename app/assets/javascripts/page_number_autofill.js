

function keyboardPressedForPageForm(event) {

  var index_sequence = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'IJ', 'K', 'L', 'M', 'N',
    'O', 'P', 'Q', 'R', 'S', 'T', 'UV', 'W', 'X', 'Y', 'Z'];


  if (event.target.classList.contains('js-page-number') && event.keyCode == 32) {


    var page_number_input = event.target.getAttribute('id').replace('page-input-', '')

    var page_number_int = parseInt(page_number_input);

    if (page_number_int && page_number_int > 1) {

      var previous_input = document.getElementById('page-input-' + (page_number_int - 1));

      if (previous_input) {

        var previous_value = previous_input.value;

        var previous_value_int = parseInt(previous_value)

        var new_value_to_set = null;

        if (previous_value_int) {
          new_value_to_set = (previous_value_int + 1)
        } else {

          var index_within_index_sequence = index_sequence.indexOf(previous_value.toUpperCase());

          if (index_within_index_sequence >= 0 && (index_within_index_sequence < (index_sequence.length - 1))) {

            new_value_to_set = index_sequence[index_within_index_sequence + 1];

          }

        }

        if (new_value_to_set) {

          event.target.value = new_value_to_set;

          // Now fire the 'change' event, which isn't done by default.
          var evt = new Event('change', {bubbles: true});
          event.target.dispatchEvent(evt);

          var next_input = document.getElementById('page-input-' + (page_number_int + 1));

          if (next_input) {
            next_input.focus();
          }


        }

      }

    }

    event.preventDefault();

  }
}


function addPageNumberAutofill() {


  var elements = document.getElementsByClassName('js-page-number-autofill');

  for (var i = elements.length - 1; i >= 0; i--) {
    elements[i].addEventListener('keydown', keyboardPressedForPageForm);
  };



}


document.addEventListener('DOMContentLoaded', addPageNumberAutofill);