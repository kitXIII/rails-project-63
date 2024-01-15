# Hexlet code form generator based on DSL.

### Hexlet code tests and linter status:
[![Actions Status](https://github.com/kitXIII/rails-project-63/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/kitXIII/rails-project-63/actions) [![CI](https://github.com/kitXIII/rails-project-63/actions/workflows/ci.yml/badge.svg)](https://github.com/kitXIII/rails-project-63/actions)

### Usage

```
User = Struct.new(:name, :job, keyword_init: true)
...

user = User.new name: "rob", job: "hexlet"
...

HexletCode.form_for user, url: '/users' do |f|
    f.input :name, class: 'user-input'
    f.input :job, as: :text, rows: 50, cols: 50
end

# <form action="/users" method="post">
#   <input name="name" type="text" value="rob" class="user-input">
#   <textarea name="job" cols="50" rows="50">hexlet</textarea>
# </form>
```
