defmodule Acceptance.HeadingAnchorsTest do
  use ExUnit.Case

  import Support.Helpers, only: [ as_html: 2]

  test "with heading anchors" do
    markdown = "# foo"
    html     = ~s{<a id=\"foo\"></a><h1>foo</h1>\n}
    messages = []

    assert as_html(markdown, heading_anchors: true) == {:ok, html, messages}
  end

  test "with capitalized letters in the heading's contents" do
    markdown = "# Foo"
    html     = ~s{<a id=\"foo\"></a><h1>Foo</h1>\n}
    messages = []

    assert as_html(markdown, heading_anchors: true) == {:ok, html, messages}
  end

  test "with spaces in the heading's contents" do
    markdown = "# foo bar baz"
    html     = ~s{<a id=\"foo-bar-baz\"></a><h1>foo bar baz</h1>\n}
    messages = []

    assert as_html(markdown, heading_anchors: true) == {:ok, html, messages}
  end
end
