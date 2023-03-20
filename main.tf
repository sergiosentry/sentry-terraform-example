terraform {
  required_providers {
    sentry = {
      source = "jianyuan/sentry"
    }
  }
}

provider "sentry" {
  token = "9bdcdadb0a2245cb965c4e138a6bb96f1798b238be624d43858abd8d91c11ebc"
}

resource "sentry_issue_alert" "main" {
  organization = "testorg-az"
  project      = "sergio-react"
  name         = "My issue alert"

  action_match = "any"
  filter_match = "any"
  frequency    = 30

  conditions = [
    {
      id   = "sentry.rules.conditions.first_seen_event.FirstSeenEventCondition"
      name = "A new issue is created"
    }
  ]

  filters = [
  ]

  actions = [
    {
      id               = "sentry.mail.actions.NotifyEmailAction"
      name             = "Send a notification to IssueOwners"
      targetType       = "IssueOwners"
      targetIdentifier = ""
    }
  ]
}
