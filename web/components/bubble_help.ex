defmodule Talk.Component do
  import Phoenix.HTML.Tag

  @moduledoc """
  These components are designed to simplify reuse throughout the application and
  to keep the design consistent where possible. Please feel free to contribute
  to this library.
  """

  @doc """
  Creates a bubble help tooltip for displaying additional information about a
  topic.

  Usage:
      <%= bubble_help  do %>
        <p> This is additional information about a topic </p>
      <% end %>

  You can pass in classes to style the flyout class:

      <%= bubble_help flyout_class: "anchor-right"  do %>
        <p> This is additional information about a topic </p>
      <% end %>

  """

  def bubble_help(options \\ [], do: contents) do
    id = "bubble-help" <> to_string(:rand.uniform(10000))
    content_tag(
      :div,
      [
        Brady.inline_svg(
          "info",
          class: "bubble-help-icon",
          "data-bubble-help": id
        ),
        content_tag(
          :div,
          contents,
          class: "bubble-help-flyout #{options[:flyout_class]}",
          role: "tooltip",
          "aria-hidden": "true",
          id: id,
        )
      ],
      class: "bubble-help",
    )
  end
end
