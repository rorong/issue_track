module IssuesHelper
    def assigned_name(issue)
       user = issue.issue_assignments.first.user.email
    end
end
