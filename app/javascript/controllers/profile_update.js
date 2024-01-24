function profileUpdate() {
  $("#save_profile").on("click", function (e) {
    setTimeout(function () {
      $("#profileMessage").slideDown("slow");

      $("#profileMessage").removeClass("hidden");
    }, 1000);

    setTimeout(function () {
      $("#profileMessage").slideUp("slow");
      $("#profileMessage").addClass("hidden");
    }, 5000);
  });
}

$(document).ready(function () {
  profileUpdate();

  $(document).on("turbo:render", function () {
    profileUpdate();
  });
});

addEventListener("turbo:before-stream-render", (event) => {
  const fallbackToDefaultActions = event.detail.render;

  event.detail.render = function (streamElement) {
    fallbackToDefaultActions(streamElement);
    profileUpdate();
  };
});
