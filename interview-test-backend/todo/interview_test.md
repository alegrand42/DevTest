# Coding interview

For the purposes of this interview, all dependencies are located in a zip file.
When you are done, simply send us your work in a zip file.

NOTE: Please, do not share your work on a public repo!

## 1. Code refactoring

#### Dependency
* `interview_test.rb`
* `interview_users.csv`

#### Tools
* Plain Old Ruby Objects

#### Objectifs
Re-write `interview_test.rb` using your favorite ruby pattern (Classes, Inheritance, Modules and Mixins)
* Stay DRY
* Explicit better than implicit
* Performance matter

## 2. Data manipulation

#### Dependency
* Use your refactored `interview_test.rb` from above
* `interview_users.csv`

#### Objectifs
* Write two functions/methods that output the following datasets using `interview_users.csv` as raw data:
  * 1. An array of office's name `['Berlin', 'London', 'Paris', 'Tokyo']`
  * 2. An array of employee count per office `[4, 2, 2, 1]`
  * NOTE: Array's indexes should correspond with each other

## 3. Code testing

#### Dependency
* Use your refactored `interview_test.rb` from above

#### Tools
* Rspec/Minitest/Test-Unit

#### Objectifs
Write the spec of your new `interview_test.rb`
* Aim 100% coverage

## 4. Rails controller refactoring
#### Objectifs
Rewrite the following Rails Controller for:
* A better control flow and naming
* Improve its security

#### Hint
`mobile_app` attributes are `id: Integer`, `name: String`, `store_ids: Array`

```ruby
class MobileAppsController < ApplicationController
  before_action :require_authenticated_user
  before_action :find_store
  before_action :find_mobile_app, only: [:show]
  before_action :check_stats_permissions

  def index
    query = MobileAppsService.new(@store)
    respond_to do |format|
      format.html { @mobile_apps = query.all }
    end
  end

  def show
    render 'show'
  end

  def create
    @app = MobileAppsService.new(@store).new_app(params[:mobile_app])
    if @app.save
      render 'create'
    else
      render_errors @app
    end
  end

  def update
    @app = MobileApp.find(params[:id])
    if @app.update_attributes(params[:mobile_app])
      render 'create'
    else
      render_errors @app
    end
  end

  private

  def find_store
    @store = Store.find_by(id: params[:store_id])
    render_access_forbidden unless @store
  end

  def check_stats_permissions
    render_access_forbidden unless current_user.has_permissions?(@store)
  end

  def find_mobile_app
    @app = MobileApp.find_by(id: params[:id])
    render_not_found unless @app
  end
end
```

## 5. Code review
In this section, you will write a README.md explaining your work (just like you would do in a Pull Request)
