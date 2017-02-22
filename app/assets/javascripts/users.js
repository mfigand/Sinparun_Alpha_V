// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

window.onload = function() {

  if($('.js-btn-nike').length){
    $(".js-btn-nike").on("click", getActivity);
  }
  if($('.js-btn-runtastic').length){
    $(".js-btn-runtastic").on("click", getActivityRuntastic);
  }
  
  // Get the modal
  var modal = document.getElementById('myModal');

  // Get the image and insert it inside the modal - use its "alt" text as a caption
  var img = document.getElementById('user_avatar');
  var modalImg = document.getElementById("img01");
  var captionText = document.getElementById("caption");
  img.onclick = function(){
      modal.style.display = "block";
      modalImg.src = this.src;
      captionText.innerHTML = this.alt;
  }

  // Get the <span> element that closes the modal
  var span = document.getElementsByClassName("close")[0];

  // When the user clicks on <span> (x), close the modal
  span.onclick = function() { 
    modal.style.display = "none";
  }

};

  var getActivity = function (){
    $('.kms_counter').empty();
    $('.total_kms_counter').empty();
    $('.level_counter').empty();
    // $('.races_counter').empty();

    var activity_request = $.get('/api_sinparun/nike');
    activity_request.done(get_kms);
  };

  function get_kms(response){
    var sync_acount = $.get('/users/sync_account/nike', response);
    sync_acount.done(get_kms_response);
    sync_acount.fail(get_kmsError);
  };

  function get_kmsError(error){
    if (error.status == 406){
      $(".message").text(error.responseText)
    }
    else {
      $(".message").text("Sorry synchronization error")
    }
  };

  function get_kms_response(kms_response){
    $(".message").text("updated synchronization");
    $(".kms_counter").text(kms_response.sinparun_kms);
    $(".total_kms_counter").text(kms_response.total_kms);
    $('.level_counter').text(kms_response.level);
    // $('.races_counter').text(kms_response.races);
  };


  var getActivityRuntastic = function (){
    $('.kms_counter').empty();
    $('.total_kms_counter').empty();
    $('.level_counter').empty();
    // $('.races_counter').empty();

    var activity_request = $.get('/api_sinparun/runtastic');
    activity_request.done(get_kms_runtastic);
    };

    function get_kms_runtastic(response_runtastic){
      var sync_acount = $.get('/users/sync_account/runtastic', response_runtastic);
      sync_acount.done(get_kms_runtastic_response);
      sync_acount.fail(get_kmsError);
    };

    function get_kms_runtastic_response(kms_response_runtastic){
      $(".message").text("updated synchronization");
      $(".kms_counter").text(kms_response_runtastic.sinparun_kms);
      $(".total_kms_counter").text(kms_response_runtastic.total_kms);
      $('.level_counter').text(kms_response_runtastic.level);
      // $('.races_counter').text(kms_response_runtastic.races);
    };
