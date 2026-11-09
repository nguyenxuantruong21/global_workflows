# global_workflows

Bộ slash command cá nhân cho Claude Code.

## Cài đặt

```sh
sh install.sh
```

Script tạo symlink vào `~/.claude/commands/`, liên kết `rules.md` và thêm một dòng import vào `~/.claude/CLAUDE.md`. File đã tồn tại sẽ không bị ghi đè. Sửa file trong repo này là lệnh được cập nhật theo.

## Các lệnh

| Lệnh                    | Khi nào dùng                                       |
| ----------------------- | -------------------------------------------------- |
| `/brainstorm [câu hỏi]` | Chưa biết nên chọn hướng nào                       |
| `/plan [task]`          | Việc lớn, cần chia phase                           |
| `/code [plan] [auto]`   | Làm theo plan; thêm `auto` để không dừng chờ duyệt |
| `/fix [vấn đề]`         | Sửa lỗi hoặc việc nhỏ, không cần plan              |

Luồng thường dùng: `/plan` → `/code`. Việc nhỏ chỉ cần `/fix`.

Plan được lưu trong `plans/` của từng dự án. Các workflow cũ nằm trong `archive/` và không được cài.
