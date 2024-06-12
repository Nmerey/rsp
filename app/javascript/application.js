// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "jquery"

console.log($)

$(document).ready(function() {
  $('.play-button').on('click', function() {
    const userThrow = $(this).data('throw');
    $('#resultModal').modal('show');
    $('#resultText').text('Waiting for server...');
    $('#resultImage').attr('src', `/assets/${userThrow}.svg`);

    $.ajax({
      url: '/games/create',
      method: 'POST',
      data: { throw: userThrow },
      dataType: 'json',
      success: function(data) {
        console.log(data);
        const resultText = data.result;
        const serverThrow = data.server_throw;
        $('#resultText').text(resultText);
        $('#serverThrow').attr('src', `/assets/${serverThrow}.svg`);
        $('#userThrow').attr('src', `/assets/${userThrow}.svg`);
      },
      error: function() {
        $('#resultText').text('Server error. Please try again.');
      }
    });
  });
});
