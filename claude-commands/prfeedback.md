Address PR review comments for the current branch.

## Instructions

1. **Find the PR**: Run `gh pr view --json number,url` to get the PR for the current branch. If no PR exists, stop and inform me.

2. **Fetch review comments**: Run `gh api repos/{owner}/{repo}/pulls/{number}/comments` to get all inline review comments. Derive the owner/repo from `gh repo view --json nameWithOwner`.

3. **Categorize comments**: For each comment, determine if it is:
   - **Actionable**: A request to change code (e.g., "rename this", "add a field", "use X instead of Y")
   - **Question**: A question that needs a response (e.g., "are all cases covered?", "should this be public?")
   - **Already resolved**: Skip comments that are replies or already addressed

4. **Address actionable comments**: For each actionable comment, make the requested code change. Read the relevant file and context before editing. Group related changes together.

5. **Run CI**: Run the project's CI/check command to verify all changes pass.

6. **Commit and push**: Stage and commit all changes with a message summarizing the review feedback addressed. Push to the current branch.

7. **Respond to questions**: For each question comment, use `gh api` to reply to the review comment with a thoughtful answer. Research the codebase or reference material as needed before answering. Use `gh api repos/{owner}/{repo}/pulls/{number}/comments/{comment_id}/replies -f body="..."` to post replies.

8. **Summary**: Show me a summary of what was changed and what questions were answered.

$ARGUMENTS
