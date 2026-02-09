import {
  component,
  fields,
  NotEditable,
} from "@keystone-6/fields-document/component-blocks";

export const componentBlocks = {
  image: component({
    label: "Image",
    schema: {
      image: fields.relationship({
        label: "Image",
        listKey: "Image",
        selection: "image { url } caption alt",
      }),
      url: fields.url({
        label: "URL",
      }),
      caption: fields.text({ label: "Caption" }),
      alt: fields.text({ label: "Alt" }),
      width: fields.integer({
        label: "Percentage Width",
        defaultValue: 100,
      }),
    },
    preview: (props) => {
      const imgUrl =
        props.fields.image.value?.data.image.url || props.fields.url.value;

      if (imgUrl) {
        const caption =
          props.fields.image.value?.data.caption || props.fields.caption.value;

        return (
          <NotEditable>
            <img
              src={
                props.fields.image.value?.data.image.url ||
                props.fields.url.value
              }
              width={props.fields.width.value + "%"}
            />
            {caption ? <span>{"\n" + caption}</span> : null}
          </NotEditable>
        );
      }

      return "Add an image.";
    },
  }),
  file: component({
    label: "File",
    schema: {
      file: fields.relationship({
        label: "File",
        listKey: "File",
        selection: "file { url } title",
      }),
      url: fields.url({ label: "URL" }),
      title: fields.text({ label: "Title" }),
    },
    preview: (props) => (
      <NotEditable>
        {props.fields.file.value?.data.title ||
          props.fields.title.value ||
          props.fields.file.value?.data.file.url ||
          props.fields.url.value ||
          "Add a file."}
      </NotEditable>
    ),
  }),
  embed: component({
    label: "Embed",
    schema: {
      embed: fields.relationship({
        label: "Embed",
        listKey: "Embed",
        selection: "label code tag",
      }),
      // type: fields.select({
      //   label: "Type",
      //   options: [
      //     { label: "", value: "" },
      //     { label: "Tweet", value: "tweet" },
      //     { label: "Rumble Video", value: "rumble_video" },
      //     { label: "Youtube Video", value: "youtube_video" },
      //   ],
      //   defaultValue: "",
      // }),
      // embedId: fields.url({ label: "ID" }),
      // title: fields.text({ label: "Title" }),
    },
    preview: (props) => (
      <NotEditable>
        {props.fields.embed.value?.data.label || "Add an embed."}
      </NotEditable>
    ),
  }),
};
