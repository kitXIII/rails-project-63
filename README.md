# Hexlet code form generator based on DSL.

### Hexlet code tests and linter status:
[![Actions Status](https://github.com/kitXIII/rails-project-63/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/kitXIII/rails-project-63/actions) [![CI](https://github.com/kitXIII/rails-project-63/actions/workflows/ci.yml/badge.svg)](https://github.com/kitXIII/rails-project-63/actions)


Hexlet сode form generator is a gem designed to simplify the creation of HTML forms.

You can use it when working with a template engine when you generate HTML containing the form of some entity.


### Usage

`HexletCode.form_for` takes as input an entity (for example, a `user`) and a URI to send data when the form is submitted.

```
User = Struct.new(:name, :job, keyword_init: true)

user = User.new name: "rob", job: "hexlet"
...

HexletCode.form_for user, url: '/users'
```

To fill the form with fields, `HexletCode.form_for` takes a block as it's last argument.

This block receives a `form object` as an argument. `Form object` has `input` and `submit` methods.

You need to pass to the `input` method the name of the entity field (in our example, the *user* entity uses the *name* and *job* fields).

```
HexletCode.form_for user, url: '/users' do |f|
    f.input :name
    f.input :job
end
```

Also You can pass HTML attributes as hash.

To configure the field type you will need a parameter `:as`.

```
f.input :name, class: 'user-input'
f.input :job, as: :text, rows: 50, cols: 50

#   <input name="name" type="text" value="rob" class="user-input">
#   <textarea name="job" cols="50" rows="50">hexlet</textarea>
```

`as: :text` - it means the field will be rendered to `textarea` element.

By default `as:` has `:string` value - it means the field will be rendered to `input` element with `type="text"` attribute.

A personal label is added to all inputs.

Сalling the `submit` method will render the `input` element with `type="submit"`

```
f.submit

#   <input type="submit" value="Save">
```

You can set a custom value for the submit element by passing it as a parameter to the `submit` method

```
f.submit 'Send'

#   <input type="submit" value="Send">
```

#### As result

Form builded with HexletCode.form_for:
```
HexletCode.form_for user, url: '/users' do |f|
    f.input :name, class: 'user-input'
    f.input :job, as: :text, rows: 50, cols: 50
    f.submit
end
```

Will be rendered to:
```
<form action="/users" method="post">
    <label for="name">Name</label>
    <input name="name" type="text" value="rob" class="user-input">
    <label for="job">Job</label>
    <textarea name="job" cols="50" rows="50">hexlet</textarea>
    <input type="submit" value="Save">
</form>
```
