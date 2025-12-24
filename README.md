# CJC102 課堂操作

## 🚀 實作目標：GitHub Actions 自動化部署至 AWS
本專案透過 CI/CD 流水線架構，實現了地端代碼（Local Code）變更後，自動觸發 GitHub Actions 進行測試並部署至 AWS 雲端環境。

### 🛠 技術棧 (Tech Stack)
* **Version Control:** Git / GitHub
* **CI/CD Tool:** GitHub Actions
* **Cloud Provider:** AWS (Amazon Web Services)
* **Infrastructure as Code:** Terraform (或你使用的部署方式)

### 🏗 部署流程架構
1.  **地端開發 (Local)**：完成代碼編寫並執行 `git push`。
2.  **觸發流水線 (Trigger)**：GitHub 偵測到 `main` 分支變更，啟動 GitHub Actions Workflow。
3.  **身份驗證 (Auth)**：透過 GitHub Secrets 儲存 AWS 憑證 (IAM Role/User)，安全地與 AWS 連線。
4.  **自動化部署 (Deploy)**：執行部署腳本（如 Terraform Apply 或 AWS CLI），更新雲端資源。

### 📝 設定步驟簡述
1.  **AWS IAM 設定**：建立具有適當權限的 IAM 使用者，並取得 `Access Key` 或配置 `OIDC`。
2.  **GitHub Secrets 設定**：在 Repository 的 Settings > Secrets 中添加 `AWS_ACCESS_KEY_ID` 與 `AWS_SECRET_ACCESS_KEY`。
3.  **Workflow 配置**：建立 `.github/workflows/deploy.yml` 檔案，定義部署邏輯。

