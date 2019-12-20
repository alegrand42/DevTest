# README

todo

## Requirements

As a user, I need a tool that outputs stats about my Adwords account. I
need to be able to configure the tool so that it can communicate with
Adwords on my behalf and perform the reports needed to get the data I
want. I want the tool to list the campaigns of my accounts in the
following format:

```
Campaign: <adwords_id> <adwords_name> [<adwords_status>] AdGroups:<number of adgroups>
```

After each campaign output, I want the tool to list the campaign
adgroups in the following format:

```
Adgroup: <adwords_id> <adwords_name> [<adwords_status>]
```

At the end of the output, I want the tool to print the mean number of
adgroups per campaign, in the following format:

```

Mean number of AdGroups per Campaign: <mean number>


```

### Notes

I will run the tool several times and I expect consistent results every
time. I'd like to perform raw SQL queries to inspect the data and therefore it needs to be stored in a RDBMS.

## Technical requirements

The given code already meets the user requirements. Well, not really,
there is a bug, but it's up to you to find it. And it lacks the
"settings display" feature.

On the technical side, it should be improved. You may change _whatever
you think you need to change_ to improve it, as long as it meets the
above user requirements and the technical requirements below. For
example, all libraries are optional (except for RSpec).

The refactoring should at least lead to:

- a Ruby codebase well-tested with RSpec 3
- a faster tool, both for getting the data from Adwords and for analyzing it
- a codebase that can easily grow to support different report objects
  (keywords, ads, and so on...) with up to dozens of thousand records for
  each of them
- a codebase that can be easily changed to support different outputs,
  using a different output format and/or a different output destination

The following goals are optional but would be most welcome:

- Bundle the tool into a Docker image backed by a PostgreSQL server
  (also running with Docker).

```
psql -U postgres
create database reports;
```

### How to start ?

- Run `bundle`
- Run `./run.sh` to setup `adwords_api.yml`.
- With the documentation we provided you, set the following values:
  - `oauth2_client_id`
  - `oauth2_client_secret`
  - `developer_token`
  - `client_customer_id`
- Run `./run.sh`. It should successfully run.
- Start working on it.
- Once you're done, contact us with your answer as a _private_ Git
  repository (either hosted or as an e-mail attachment). Our developer
  team will review it and then discuss it with you during a meeting.

### Help

The Adwords API is rich and can sometimes be counter-intuitive. The test
is much more about Ruby and software development than it is about
dealing with the API.

If you think you're spending too much time on dealing with the API, stop
and simply use the provided Adwords API Ruby SDK code. We will then
expect you to explain what problems you faced and how you tried
to solve them.

The following links might help you:

- https://developers.google.com/adwords/api/docs/samples/ruby/basic-operations
- https://developers.google.com/adwords/api/docs/reference/v201809/CampaignService
- https://developers.google.com/adwords/api/docs/reference/v201809/CampaignService.Selector
- https://developers.google.com/adwords/api/docs/reference/v201809/CampaignService.CampaignPage
- https://developers.google.com/adwords/api/docs/reference/v201809/AdGroupService
