/* eslint-env browser */

const ksExtPAGE_PATHS = [
  "posts",
  "topics",
  "pages",
  "journalists",
  "shows",
  "regions",
  //"embeds",
];

let ksExtLinkURLIntervalID = null;

function ksExtClearLinkURLIntervalID(intervalID) {
  clearInterval(intervalID);
  ksExtLinkURLIntervalID = null;
}

function ksExtLinkURL() {
  if (ksExtLinkURLIntervalID)
    ksExtClearLinkURLIntervalID(ksExtLinkURLIntervalID);
  const pathArr = window.location.pathname.slice(1).split("/");

  if (pathArr.length > 1 && ksExtPAGE_PATHS.includes(pathArr[0])) {
    let linkURLTry = 1;

    ksExtLinkURLIntervalID = setInterval(() => {
      console.log("Link URL attempt: " + linkURLTry);

      const linkURLTries = 8;
      const $labels = document.querySelectorAll(
        ".css-bkb1wo label.css-11ditgu:not([for])",
      );

      for (const $label of $labels) {
        if (
          $label.textContent === "URL" /* ||
          $label.textContent === "Fundist URL"*/
        ) {
          const $link = document.createElement("a");
          const url = $label.nextSibling;
          $link.href = url.nodeValue;
          $link.target = "_blank";

          const $icon = document.createElement("span");
          $icon.id = "linkURLIcon";
          $icon.innerHTML = "&nearr;";

          url.replaceWith($link);
          $link.appendChild(url);
          $link.insertAdjacentElement("afterend", $icon);

          // if (pathArr[0] === "embeds") {
          //   const $prevFieldLabel =
          //     $label.parentElement.parentElement.previousElementSibling.querySelector(
          //       ".css-bkb1wo label.css-11ditgu:not([for])",
          //     );

          //   if ($prevFieldLabel.textContent === "Fundist Code") {
          //     const fundistCode = $prevFieldLabel.nextSibling;
          //     const $code = document.createElement("code");
          //     $code.id = "fundistEmbedCode";

          //     fundistCode.replaceWith($code);
          //     $code.appendChild(fundistCode);
          //   }
          // }

          linkURLTry = linkURLTries;
        }
      }

      linkURLTry += 1;

      if (linkURLTry > linkURLTries)
        ksExtClearLinkURLIntervalID(ksExtLinkURLIntervalID);
    }, 1000);
  }
}

const ksExtObserver = new MutationObserver(ksExtLinkURL);

ksExtObserver.observe(document.querySelector("#__next"), {
  childList: true,
});

ksExtLinkURL();
