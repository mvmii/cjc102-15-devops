# 🚀GitHub & AWS 自動化部署實作

## 📝 專案簡介
本專案實作了將地端 Python Flask 應用程式透過 GitHub 自動部署至 AWS 環境的完整流程。利用 Docker 容器化技術，配合 AWS CodeBuild 與 ECR 進行映像檔建置，最後部署於 EC2 執行環境。

### 🛠 技術棧
- **Application:** Python 3.13 / Flask 3.1.2
- **Containerization:** Docker
- **CI/CD:** GitHub, AWS CodeBuild
- **Cloud Infrastructure:** AWS EC2, ECR, IAM Role

---

## 🏗 自動化架構流程
1. **Developer:** `git push` 代碼至 GitHub。
2. **AWS CodeBuild:** 偵測到 GitHub 變更，自動啟動 Build 流程：
   - 執行 `test_flask.py` 進行單元測試。
   - 測試通過後，根據 `Dockerfile` 封裝映像檔。
   - 將映像檔推送到 **AWS ECR (Elastic Container Registry)**。
3. **AWS EC2:** 與 ECR 連動，拉取最新映像檔並運行容器。


---

## 步驟

### 第一步：準備 AWS 基礎設施
#### 1. 建立 EC2 執行環境
- 啟動一台 Linux EC2 (建議使用 Amazon Linux 2023)。
- 網路配置: 開啟 22 與 80 port
- 
  ```bash
  sudo yum update -y
  sudo yum install -y docker

  systemctl start docker
  systemctl enable docker
  usermod -a -G docker ec2-user
  mkdir -p /home/ec2-user/.docker/cli-plugins
  curl -SL https://github.com/docker/compose/releases/download/v2.26.1/docker-compose-linux-x86_64 -o /home/ec2-user/.docker/cli-plugins/docker-compose
  chmod +x /home/ec2-user/.docker/cli-plugins/docker-compose

  chown -R ec2-user:ec2-user /home/ec2-user/.docker/

  yum install -y git




#### 2. 