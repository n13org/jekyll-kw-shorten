
The project `jekyll-kw-shorten` is a plug-in for a [jekyll](https://jekyllrb.com/) static page blog.

It can be used as **[filter](https://jekyllrb.com/docs/plugins/filters/)** and as **[tag](https://jekyllrb.com/docs/plugins/tag/)**.

It is published on [rubygems.org](https://rubygems.org/gems/jekyll-kw-shorten), the source code is hosted on [GitHub](https://github.com/n13org/jekyll-kw-shorten).

## Usage

Use the filter `{{ 1234 | shorten }}` or the tag `{% shorten 1234 %}` inside your markdown blog post file to get `1.2 K`.

The plug-in supports

* positiv numbers
* negativ numbers with leading `-` or `- `.
* float numbers (when multiple dots are in the text only the part to the first will be taken)
* Text with no numbers inside will simply echoed
* Text with numbers, will be reduced to just the digits 
* Show a rocket `∞ 🚀` for very huge values (>= 1000000000000)
* Float numbers will be rounded

### Examples as Jekyll Tag

| Syntax                        | OK | Result   |
|-------------------------------|:--:|----------|
| {% shorten "MyText" %}        | ✔️  | "MyText" |
| {% shorten MyText %}          | ✔️  | MyText   |
| {% shorten "My43Text" %}      | ✔️  | 43       |
| {% shorten "My43.56Text" %}   | ✔️  | 44       |
| {% shorten "My43.56.7Text" %} | ✔️  | 44       |
| {% shorten "1234" %}          | ✔️  | 1.2 K    |
| {% shorten 1 %}               | ✔️  | 1        |
| {% shorten -22 %}             | ✔️  | -22      |
| {% shorten - 44 %}            | ✔️  | -44      |
| {% shorten 1000 %}            | ✔️  | 1.0 K    |
| {% shorten 1000000 %}         | ✔️  | 1.0 M    |
| {% shorten 1000000000 %}      | ✔️  | 1.0 B    |
| {% shorten 1000000000000 %}   | ✔️  | ∞ 🚀     |

### Examples as Jekyll Filter

| Syntax                           | OK | Result   |
|----------------------------------|:--:|----------|
| {{ "MyText" \| shorten }}        | ✔️ | "MyText" |
| {{ MyText \| shorten }}          | ❌ |          |
| {{ "My43Text" \| shorten }}      | ✔️ | 43       |
| {{ "My43.56Text" \| shorten }}   | ✔️ | 44       |
| {{ "My43.56.7Text" \| shorten }} | ✔️ | 44       |
| {{ "1234" \| shorten }}          | ✔️ | 1.2 K    |
| {{ 1 \| shorten }}               | ✔️ | 1        |
| {{ -22 \| shorten }}             | ✔️ | -22      |
| {{ - 44 \| shorten }}            | ❌ |          |
| {{ 1000 \| shorten }}            | ✔️ | 1.0 K    |
| {{ 1000000 \| shorten }}         | ✔️ | 1.0 M    |
| {{ 1000000000 \| shorten }}      | ✔️ | 1.0 B    |
| {{ 1000000000000 \| shorten }}   | ✔️ | ∞ 🚀     |

**HINT**:
The filter `{{ MyText | shorten }}` will show nothing (empty string). The filter "thinks" the MyText is a variable (with the value nil). Numbers can be used with and without quotes. Text must be wrapped in quotes.

## Installation

Add `jekyll-kw-shorten` plugin in your Gemfile inside the `jekyll_plugins` group.

```ruby
group :jekyll_plugins do
  ...
  gem "jekyll-kw-shorten"
  ...
end
```

Run `bundle install` to install the gem and update the Gemfile.lock.

Add `jekyll-kw-shorten` to the plugins section in your site's `_config.yml`. Then [configure](#configuration) your plug-in.

```yaml
plugins:
  - jekyll-kw-shorten
```

## Configuration

Add the setting to your `_config.yml` file. Details you can find in the [documentation](https://jekyllrb.com/docs/configuration/). The name of the group is `jekyll-kw-shorten`.

* **shorten_gt3_digit** will be used for numbers between 1000 and 999999. Default is `' K'`.
* **shorten_gt6_digit** will be used for numbers between 1000000 and 999999999. Default is `' M'`.
* **shorten_gt9_digit** will be used for numbers between 1000000000 and 999999999999. Default is `' B'`.

```yaml
...
jekyll-kw-shorten:
  shorten_gt3_digit: ' K'
  shorten_gt6_digit: ' M'
  shorten_gt9_digit: ' B'
...
```

When the config values are omit then the default values are used. 

## Test locally

Run linting

```shell
bundle exec rubocop
```

Run tests

```shell
bundle exec rake test
```
