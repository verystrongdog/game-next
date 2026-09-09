# actions/github-script 参考

> Action：`actions/github-script@v9`
>
> 运行时：Node.js 24
>
> 自托管 Runner：`v2.327.1` 或更高
>
> 来源：[官方 README](https://github.com/actions/github-script/blob/main/README.md)、[Issue Labels API](https://docs.github.com/en/rest/issues/labels)、[Issue Comments API](https://docs.github.com/en/rest/issues/comments)、[Workflow 事件](https://docs.github.com/en/actions/reference/workflows-and-actions/events-that-trigger-workflows)、[Workflow 权限](https://docs.github.com/en/actions/reference/workflows-and-actions/workflow-syntax)

## 当前版本与调用方式

使用当前主版本：

```yaml
- uses: actions/github-script@v9
```

v9 使用内置 Node 24 运行时，不受 `actions/setup-node` 安装版本影响。
自托管 Runner 必须不低于 `v2.327.1`。REST API 位于
`github.rest.*` 下。

Issue 标签与评论操作共享以下参数：

```js
const { owner, repo } = context.repo;
const issue_number = context.issue.number;
```

```js
await github.rest.issues.removeLabel({ owner, repo, issue_number, name });
await github.rest.issues.addLabels({
  owner,
  repo,
  issue_number,
  labels: ["status:triage", "needs:admission-review"],
});
await github.rest.issues.createComment({
  owner,
  repo,
  issue_number,
  body: "The specification changed and requires admission review.",
});
```

`removeLabel` 在目标标签不存在时返回 `404`。只应忽略这一预期竞态，其他 API
错误必须继续抛出。修改标签和创建评论需要：

```yaml
permissions:
  issues: write
```

## Project Notes

- 2026-09-09：`issue-spec-guard.yml` 监听 `issues.edited`。打开的 Issue
  若处于 `status:ready`、`status:in-progress` 或 `status:verify`，必须先移除活动状态，
  再添加 `status:triage` 与 `needs:admission-review`，最后评论说明旧批准失效。
- 2026-09-09：Issue 正文属于不可信输入；不要把正文用表达式直接插入
  `script:` 形成 JavaScript 源码。本 guard 不读取正文，只读取事件标签快照。
- 2026-09-09：缺少预设标签属于仓库初始化失败，不得静默忽略。
- 2026-09-09：当前 guard 对所有符合条件的正文/标题编辑一律撤销准入；是否只是无害编辑，
  由重新审查判断。若未来出现重复评论问题，再增加实时状态或评论标记检查，不提前复杂化。
