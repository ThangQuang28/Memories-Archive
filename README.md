# 💍 Wedding

> A Flutter Web application for preserving memories, important dates and photo collections.

---

## Project Information

| Item            | Value                |
| --------------- | -------------------- |
| Project Name    | Wedding              |
| Platform        | Flutter Web          |
| Language        | Dart                 |
| Framework       | Flutter              |
| Status          | 🚧 Under Development |
| Current Version | v1.0.0               |

---

## Project Vision

Wedding là một ứng dụng Flutter Web được xây dựng nhằm lưu giữ những kỷ niệm, hình ảnh và các mốc thời gian quan trọng trong một giao diện tối giản, hiện đại và dễ sử dụng.

Dự án được định hướng phát triển theo các tiêu chí:

* Dễ mở rộng.
* Dễ bảo trì.
* Hiệu năng ổn định.
* Thiết kế nhất quán.
* Mã nguồn rõ ràng và có khả năng tái sử dụng.

---

## Main Features

## Authentication

* Đăng nhập.
* Đăng xuất.

---

## Memories

* Lưu trữ các kỷ niệm.
* Chỉnh sửa thông tin.
* Xóa dữ liệu.
* Xem chi tiết.

---

## Timeline

* Lưu các ngày quan trọng.
* Tính số ngày đã qua.
* Tính số ngày còn lại.
* Hiển thị dòng thời gian.

---

## Gallery

* Lưu trữ ảnh.
* Hiển thị ảnh.
* Xóa ảnh.

---

## Dashboard

* Hiển thị thông tin tổng quan.
* Thống kê nhanh.
* Truy cập nhanh đến các chức năng.

---

## Technology Stack

| Technology   | Status  |
| ------------ | ------- |
| Flutter      | ✅      |
| Dart         | ✅      |
| Material 3   | ✅      |
| flutter_bloc | Planned |
| go_router    | Planned |
| dio          | Planned |
| intl         | Planned |

---

## Design Philosophy

Website hướng đến phong cách:

* Minimal
* Clean
* Elegant
* Responsive
* Consistent

Mọi thành phần giao diện phải tuân thủ Design System của dự án.

---

## Typography

Primary Font

```text
Simple Serenity
```

Typography được quản lý tập trung trong:

```text
lib/core/theme/app_text_styles.dart
```

---

## Theme

Toàn bộ màu sắc và giao diện được quản lý tại:

```text
lib/core/theme/
```

Bao gồm:

* AppColors
* AppTextStyles
* AppTheme

Không khai báo trực tiếp `Color` hoặc `TextStyle` nếu đã có cấu hình dùng chung.

---

## Project Structure

```text
# Project Structure

```text
lib/
│
├── config/                         # Cấu hình ứng dụng
│   ├── app_config.dart             # Cấu hình chung
│   └── env.dart                    # Biến môi trường (nếu cần)
│
├── core/                           # Thành phần cốt lõi của hệ thống
│   │
│   ├── constants/                  # Hằng số dùng toàn dự án
│   │   ├── app_assets.dart
│   │   ├── app_constants.dart
│   │   ├── app_sizes.dart
│   │   └── app_strings.dart
│   │
│   ├── helpers/                    # Hàm hỗ trợ dùng chung
│   │   ├── date_helper.dart
│   │   ├── image_helper.dart
│   │   └── file_helper.dart
│   │
│   ├── router/                     # Điều hướng ứng dụng
│   │   ├── app_router.dart
│   │   └── route_name.dart
│   │
│   ├── services/                   # Các dịch vụ dùng chung
│   │   ├── api_service.dart
│   │   ├── storage_service.dart
│   │   └── image_service.dart
│   │
│   ├── theme/                      # Design System
│   │   ├── app_colors.dart
│   │   ├── app_text_styles.dart
│   │   └── app_theme.dart
│   │
│   └── validators/                 # Kiểm tra dữ liệu đầu vào
│       ├── email_validator.dart
│       ├── password_validator.dart
│       └── common_validator.dart
│
├── shared/                         # Thành phần tái sử dụng
│   │
│   ├── dialogs/
│   │   ├── app_dialog.dart
│   │   ├── confirm_dialog.dart
│   │   └── loading_dialog.dart
│   │
│   └── widgets/
│       ├── primary_button.dart
│       ├── custom_text_field.dart
│       ├── app_card.dart
│       ├── app_loading.dart
│       ├── empty_state.dart
│       └── image_view.dart
│
├── features/
│   │
│   ├── auth/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   │       ├── cubit/
│   │       ├── pages/
│   │       └── widgets/
│   │
│   ├── dashboard/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   │
│   ├── gallery/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   │
│   ├── memories/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   │
│   ├── profile/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   │
│   ├── settings/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   │
│   └── timeline/
│       ├── data/
│       ├── domain/
│       └── presentation/
│
├── app.dart                        # Widget gốc của ứng dụng
└── main.dart                       # Điểm khởi động
```

---

## Ý nghĩa

## config/

Quản lý cấu hình của ứng dụng.

Ví dụ:

* URL API
* Môi trường chạy
* Các thông số cấu hình

---

## core/

Chứa các thành phần nền tảng được sử dụng bởi toàn bộ hệ thống.

Không chứa logic nghiệp vụ.

---

## shared/

Các Widget hoặc Dialog có thể tái sử dụng giữa nhiều Feature.

Nếu một thành phần được sử dụng từ hai Feature trở lên, nên đặt tại đây.

---

## features/

Mỗi thư mục đại diện cho một chức năng độc lập.

Mỗi Feature tự quản lý:

* Data
* Domain
* Presentation

Không phụ thuộc trực tiếp vào Feature khác.

---

## data/

Làm việc với nguồn dữ liệu.

Ví dụ:

* API
* Local Storage
* File
* Image

---

## domain/

Chứa các quy tắc nghiệp vụ của Feature.

Không phụ thuộc vào Flutter.

---

## presentation/

Chứa giao diện và quản lý trạng thái.

Bao gồm:

* Pages
* Widgets
* Cubit

---

## Nguyên tắc mở rộng

Khi cần thêm chức năng mới, chỉ cần tạo thêm một thư mục trong `features/` theo cùng cấu trúc mà không ảnh hưởng đến các Feature hiện có.

--

## Performance Goals

Trong toàn bộ quá trình phát triển, dự án ưu tiên:

* Giảm số lần rebuild Widget.
* Hạn chế cấp phát bộ nhớ không cần thiết.
* Tái sử dụng Widget.
* Chỉ tải dữ liệu khi cần.
* Không thực hiện xử lý nặng trong `build()`.
* Quản lý đúng vòng đời của `Controller` và các tài nguyên.
* Ưu tiên mã nguồn rõ ràng trước khi tối ưu vi mô.

---

## Development Principles

* Feature First.
* Single Responsibility.
* Separation of Concerns.
* Reusable Components.
* Design System First.
* Composition over Inheritance.
* DRY.
* KISS.
* YAGNI.

---

## Getting Started

## Clone project

```bash
git clone <repository-url>
```

## Install dependencies

```bash
flutter pub get
```

## Run

```bash
flutter run -d chrome
```

---

## Roadmap

## Phase 1

* Foundation
* Theme
* Shared Widgets

## Phase 2

* Authentication
* Router
* Dashboard

## Phase 3

* Memories
* Timeline
* Gallery

## Phase 4

* State Management
* Data Layer
* Responsive Layout
* Testing
* Performance Optimization

---

## Documentation

Các tài liệu chi tiết sẽ được bổ sung trong thư mục:

```text
docs/
```

---

## License

Private Project
