$(document).ready(function() {
  $(".tab").on("click", function(e){
    // Scroll down
    // Change active tab
    $(".tab.active").removeClass("active");
    $(this).addClass("active");
    // Hide all tab-content (use class="hidden")
    $(".tab-content").addClass("hidden");
    // Show target tab-content (use class="hidden")
    var active = $(this).data("target");
    $(active).removeClass("hidden");
    $('html, body').animate({scrollTop: '+=300px'}, 400);
  });
});
