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
          "data-bubble-help": id,
          "role": "button"
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

  def open_modal_link(_, _, opts \\ [])

  def open_modal_link(modal_name, opts, block) when is_list(opts) and is_list(block) do
    content_tag(:a, opts ++ modal_options(modal_name), block)
  end

  def open_modal_link(text, modal_name, opts) do
    content_tag(:a, text, opts ++ modal_options(modal_name))
  end

  defp modal_options(modal_name) do
    [href: "#modal-#{modal_name}", rel: "modal:open"]
  end
  def modal(name, options \\ [], fun) do
    options = name |> default_options |> merge(options)
    content_tag(:div, options) do
      fun.()
    end
  end
  defp default_options(name) do
    [id: "modal-#{name}", class: "modal", style: "display:none"]
  end

  defp merge(list1, list2) do
    Keyword.merge list1, list2, fn (_, v1, v2) ->
      v1 <> " " <> v2
    end
  end
end
