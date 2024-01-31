function profileUpdate() {
  $("#user-form").on("submit", function (e) {
    setTimeout(function () {
      $("#profileMessage").slideDown("slow");

      $("#profileMessage").removeClass("hidden");
    }, 1000);

    setTimeout(function () {
      $("#profileMessage").slideUp("slow");
      $("#profileMessage").addClass("hidden");
    }, 5000);
    console.log("form submitted");
  })
  // $("#save_profile").on("click", function (e) {
  //   setTimeout(function () {
  //     $("#profileMessage").slideDown("slow");

  //     $("#profileMessage").toggleClass("hidden");
  //   }, 1000);

  //   setTimeout(function () {
  //     $("#profileMessage").slideUp("slow");
  //     $("#profileMessage").toggleClass("hidden");
  //   }, 5000);
  //   console.log("button-clicked");
  // });
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
