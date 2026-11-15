# global_workflows

Bộ slash command cá nhân cho Claude Code.

## Cài đặt

```sh
sh install.sh
```

Script tạo symlink vào `~/.claude/commands/` và `~/.claude/skills/`, liên kết `rules.md` và thêm một dòng import vào `~/.claude/CLAUDE.md`. File đã tồn tại sẽ không bị ghi đè. Sửa file trong repo này là lệnh được cập nhật theo.

## Các lệnh

| Lệnh                    | Khi nào dùng                                       |
| ----------------------- | -------------------------------------------------- |
| `/brainstorm [câu hỏi]` | Chưa biết nên chọn hướng nào                       |
| `/plan [task]`          | Việc lớn, cần chia phase                           |
| `/code [plan] [auto]`   | Làm theo plan; thêm `auto` để không dừng chờ duyệt |
| `/fix [vấn đề]`         | Sửa lỗi hoặc việc nhỏ, không cần plan              |
| `/review-code [target]` | Review thay đổi, không sửa file                    |

Luồng thường dùng: `/plan` → `/code`. Việc nhỏ chỉ cần `/fix`.

Plan được lưu trong `plans/` của từng dự án.

## Skill `code-standards`

Chuẩn code chung cho mọi dự án, nằm trong `skills/code-standards/SKILL.md`. Agent dùng skill này mỗi khi viết, sửa hoặc review code; rule riêng của dự án luôn được ưu tiên hơn.

File gồm rule chung cho mọi ngôn ngữ, rồi tới phần TypeScript và React. Thêm ngôn ngữ khác bằng một mục `## <Ngôn ngữ>` mới ở cuối file. Giữ mọi rule trong `SKILL.md`: file phụ đặt cạnh nó nằm sau symlink nên agent cần xin quyền mới đọc được.

## Skill `ops-standards`

Rule riêng cho dự án OpsAssist Dashboard 2.0, đặt ở repo này để không phải sửa gì trong dự án. `rules.md` chỉ bật skill này khi đang làm trong thư mục dự án đó.

- `SKILL.md`: yêu cầu đọc `.github/copilot-instructions.md` của dự án, nêu các chỗ cần sửa lại so với file đó, và bổ sung rule về cấu trúc, đặt tên, vị trí file, helper và git.
- `eslint.ops.config.mjs`: nạp ESLint config của dự án và thêm 3 rule ở mức warn. Chạy tại thư mục dự án: `npx eslint . -c ~/.claude/skills/ops-standards/eslint.ops.config.mjs`.

Thêm skill cho dự án khác: tạo `skills/<tên>-standards/SKILL.md`, rồi thêm một dòng vào `rules.md` trỏ tới đường dẫn của dự án đó.