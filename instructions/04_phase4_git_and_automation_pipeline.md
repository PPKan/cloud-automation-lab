# Phase 4 — 不再由「你」部署環境

截至目前為止，雖然你已經使用 Terraform，但整個流程仍然高度依賴你本人：你在自己的電腦修改 configuration，你執行 plan，你決定何時 apply。這已經比 Portal 手動操作進步很多，但如果放到真實團隊裡，還會遇到新的問題：誰改了 infrastructure？改了什麼？有人 review 嗎？每個人電腦上的 Terraform 版本和 credential 都一樣嗎？Production deployment 應該由誰執行？

這一關要把 Terraform 從「個人自動化工具」推進成「團隊工程流程的一部分」。

## 情境

假設現在有兩個工程師共同維護你的 Azure lab。公司不希望任何一個人默默在本機改完 Terraform 後直接 apply production，而是希望所有 infrastructure change 都要留下版本紀錄，並在真正變更前先看得見 plan。

你的任務是把 Phase 3 的 Terraform repository 放進 Git-based workflow，並加入一個簡單的自動化 pipeline。

## 你的任務

首先，讓整個專案使用 Git 管理，並建立一個你自己能理解的 branch / commit workflow。你不需要設計複雜 GitFlow，但至少要做到每一個 infrastructure change 都能在 commit history 裡被看見。

接著使用 GitHub Actions、Azure DevOps Pipeline 或你選擇的 CI/CD 系統，完成一個最小化的 automation flow。理想上，當你提交 Terraform 變更時，pipeline 至少可以自動執行 validation 或 plan；至於 apply 是否自動化，可以根據你的安全理解與實作難度決定，不必勉強。

你需要自己研究 pipeline 如何取得 Azure authentication，以及怎樣做才不需要把敏感 credential 直接寫在 repository 裡。這裡會再次碰到 identity 與 secret management，因此 Phase 3 的概念會重新出現。

## 你要思考的問題

- 為什麼 Infrastructure code 需要 code review？
- Terraform plan 放進 Pull Request / pipeline 有什麼價值？
- 為什麼不應該把 Azure credential 寫進 repository？
- 如果 pipeline 有權修改 production infrastructure，那 pipeline identity 本身是不是重要的 security boundary？
- Manual apply 與 automated apply 各有什麼優缺點？
- 一個 infrastructure change 要怎麼留下 audit trail？
- 你的 Excel 手順書與這種 Git + IaC workflow，本質上都是想讓變更「可控」，但兩者控制的方法有什麼不同？

## 建議留下的成果

保留一個你實際使用過的 Pull Request 或至少一段完整 Git history，讓自己可以回頭看某次 infrastructure change 是怎麼發生的。README 裡補上一段 deployment flow，最好畫成：

開發者修改 Terraform → Git commit / PR → pipeline validation / plan → review → apply → Azure。

## 完成條件

當 infrastructure change 不再只是「你在本機打 terraform apply」，而是至少有 Git versioning 與一段自動化 validation / plan pipeline，就可以把 Phase 4 視為完成。

你不需要把 pipeline 做成企業級，也不要因為看到 Docker、Kubernetes、GitOps 等詞就開始擴張專案。

## 這一關真正要觀察的事情

請問自己：你會不會享受「把人的操作移到系統裡」這件事？你對 pipeline、automation、repeatability 是否產生明顯興趣？如果這一關比前面的 Azure resource 本身更吸引你，Cloud Automation / DevOps / Platform Engineering 可能比 Cloud Security 更符合你的核心興趣。
