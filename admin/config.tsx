import Script from "next/script";
import Image from "next/image";
import Link from "next/link";

function CustomLogo() {
  return (
    <>
      <Script src="/script.js" />

      <style jsx global>{`
        /*.css-1x93dn8-PageWrapper {
          grid-template-rows: repeat(2, 60px) auto;
        }*/
        div#__next > div {
          grid-template-rows: repeat(2, 60px) auto;
        }

        @media (min-width: 576px) {
          /*.css-1x93dn8-PageWrapper {
            grid-template-columns: minmax(200px, 1fr) 5.5fr;
            grid-template-rows: 65px auto;
          }*/
          div#__next > div {
            grid-template-columns: minmax(250px, 1fr) 5fr;
            grid-template-rows: 65px auto;
          }

          /*.css-1ovxsor-ColumnLayout {
            grid-template-columns: 2.5fr 1fr;
          }*/
          div#__next > div > main > div > div {
            grid-template-columns: 2.25fr 1fr;
          }

          /*.css-1i6jkav-PageContainer,
          .css-1hicg15-Content {
            padding-left: 0;
          }*/
          div#__next > div > header,
          div#__next > div > main {
            padding-left: 0;
          }

          /*.css-1pthaa9-StickySidebar {
            margin-bottom: 24px;
          }*/
          main > div > div > div:nth-child(2) {
            margin-bottom: 24px;
          }
        }

        @media (min-width: 1050px) {
          /*.css-1pthaa9-StickySidebar {
            max-height: calc(100vh - 113px);
            overflow-y: auto;
          }*/
          main > div > div > div:nth-child(2) {
            max-height: calc(100vh - 113px);
            overflow-y: auto;
          }

          /*.css-1l454jg-ToolbarContainer + .css-wxg0gn-DocumentEditor {
            min-height: 475px;
          }*/
          div[data-slate-editor="true"] {
            min-height: 475px;
          }
        }

        /*.css-14knrvn-ColumnLayout {
          max-width: 100%;
        }*/
        div#__next > div > main > div {
          max-width: 100%;
        }

        main
          > div
          > div
          > div:nth-child(2)
          > div:last-child
          > div
          > div
          > fieldset
          > legend
          + div
          > div:last-child
          > div {
          flex-wrap: wrap;
        }

        main
          > div
          > div
          > div:nth-child(2)
          > div:last-child
          > div
          > div
          > fieldset
          > legend
          + div
          > div:last-child
          > div
          > div:last-child
          > a {
          padding-left: 0;
        }

        /*.fileInputParent {
          background-color: #f2f2f2;
        }*/

        #linkURLIcon {
          color: rgb(177, 181, 185);
          font-weight: bold;
          margin-left: 5px;
        }

        /*#fundistEmbedCode {
          display: block;
          background-color: #28282b;
          color: #fff;
          padding: 0.75rem 1.25rem;
          border-radius: 0.5rem;
        }*/
      `}</style>

      <Link href="/">
        <Image
          priority
          src="/logo.svg"
          alt="Logo"
          height={20}
          width={149}
        />
      </Link>
    </>
  );
}

export const components = {
  Logo: CustomLogo,
};
