# Phase 1 — 親手建立你的第一個 Azure 小環境

現在你已經知道 Azure 裡大概有哪些積木，下一關要做的事情非常單純：不要急著自動化，先親手建立一個小型雲端環境。這一關的目的，是讓你知道自己之後到底要用 Terraform 自動化什麼。如果你連手動建立一個環境時背後發生了什麼都不理解，那麼直接進入 IaC 很容易變成「把網路上的範例貼進去，看到 apply success 就以為自己懂了」。

想像你的團隊需要一個隔離的測試環境。這個環境不需要真的承載網站，也不需要 Kubernetes 或任何複雜服務；它只需要具備最基本的網路、權限與 secret 管理概念，並且讓你有機會觀察 Azure Portal 裡不同資源如何互相連接。

## 你的任務

請手動建立一個小型 Azure 環境，至少包含：

- 一個 Resource Group。
- 一個 Virtual Network。
- 至少兩個 Subnet，讓你可以開始思考不同用途的 network segment。
- 至少一個 Network Security Group，並把它實際套用到適當的位置。
- 一個 Key Vault。
- 一個可以讓你實際觀察 Azure RBAC 的情境，例如讓某個 identity 只有讀取權限、另一個 identity 擁有更高權限。
- 如果你覺得準備好了，可以額外觀察 Managed Identity，但這一關不要求你一定完整實作 workload identity。

建立環境的過程中不要只記「點哪裡」。每新增一個資源，都請問自己：「如果沒有這個東西，會發生什麼？」「它是在管理 network、identity、resource organization 還是 secret？」如果你發現某個設定只是照教學做，但自己不知道原因，就先停下來查清楚再繼續。

這一關可以使用 Azure Portal，甚至刻意使用 Portal。你目前要建立的是直覺，而不是追求 automation。

## 建議留下的紀錄

完成之後，畫一張實際環境架構圖，並用一篇短文說明：

- 你建立了哪些資源。
- 為什麼需要兩個 Subnet。
- NSG 在你的環境裡限制了什麼。
- RBAC 是如何決定「誰能對哪些資源做什麼」。
- Key Vault 在這個環境裡扮演什麼角色。
- 哪一個 Azure 概念最容易跟你原本的 Entra / CA 經驗連起來，哪一個最陌生。

這不是 SOP，因此不需要記錄每個 click；你要留下的是「系統為什麼這樣組」。

## 完成條件

你能夠把整個環境刪除前，先對著自己的架構圖說明每個元件的用途，並且知道如果拿掉其中一個元件，系統的安全或結構會有什麼改變。做到這裡就可以結束 Phase 1。

## 這一關真正要觀察的事情

這是你第一次比較直接接觸 Azure Infrastructure。請觀察自己是覺得「終於碰到真正的系統結構，很有意思」，還是「我其實只對 Identity 有興趣，network/resource 這些東西很無聊」。兩種結果都很有價值，因為它們會決定你接下來比較靠 Cloud Security、Identity Security，還是根本不想走 Infrastructure。
