# Phase 0 — 先畫出你要進入的世界

你現在已經碰過 Microsoft Entra ID、Conditional Access 與 Intune，因此你並不是從「完全不知道 Microsoft Cloud 是什麼」開始。不過，Entra 與 Intune 主要讓你接觸的是 Identity、Access Policy 與 Device Management；接下來這個專案要把你的視野往 Azure Infrastructure 延伸，讓你第一次真正看懂「一套雲端環境」是由哪些東西組成，以及 Identity 在裡面扮演什麼角色。

這一關不要求你建立任何複雜系統，也不要求你碰 Terraform。你的任務是先建立一個能夠支撐後續實作的 mental model。你應該能夠用自己的話說明，一個 Azure tenant / subscription 裡面，Resource Group、Virtual Network、Subnet、Network Security Group、Identity、RBAC、Key Vault 等概念彼此之間大概是什麼關係。你不需要背定義，但要能知道「這個東西是拿來解決什麼問題」。

想像你今天剛加入一個小型團隊，公司希望你協助建立一套新的 Azure 測試環境。團隊裡的人會說：「我們需要一個 resource group、一個 network、一些權限控制，之後可能還要放 secret。」你的第一個挑戰不是馬上去 Azure Portal 點按鈕，而是先讓自己能夠聽懂這些詞背後代表的結構。

## 你的任務

你需要建立一張自己的概念圖，內容至少包含以下元素，而且要能清楚說明它們之間的關係：

- Microsoft Entra tenant
- Azure subscription
- Resource Group
- Virtual Network
- Subnet
- Network Security Group
- Entra identity
- Azure RBAC
- Managed Identity
- Key Vault

你可以用紙、Excalidraw、draw.io、Mermaid 或任何你喜歡的方式畫圖。重點不是漂亮，而是你自己看得懂，而且隔一週回來仍然能解釋。

接著，請試著回答幾個問題。這些問題不要求一次答對，你可以把它們當作本關的研究方向：

- Entra ID 和 Azure subscription 是什麼關係？
- Authentication 和 Authorization 在 Azure 裡分別大概發生在哪裡？
- Azure RBAC 解決的是什麼問題？它和 Conditional Access 有什麼不同？
- VNet、Subnet、NSG 各自控制的是什麼層級的事情？
- 為什麼 Cloud 環境裡除了「人」的 identity，還會需要 Managed Identity 這類 workload identity？
- Key Vault 為什麼存在？如果不用它，團隊可能會怎麼錯誤地處理 secret？

## 完成條件

當你可以在不看文件的情況下，用五到十分鐘把這整張圖講給另一個人聽，而且不會把 Entra、RBAC、network 與 resource hierarchy 混在一起，就可以把 Phase 0 視為完成。你不需要成為 Azure 專家，只需要讓後面的每個 resource 不再只是陌生名詞。

## 這一關真正要觀察的事情

做完後請記下一小段心得：你看到這種系統結構時，會不會自然想知道每一層怎麼接起來？你對「Identity 如何一路連到 Resource」這件事有沒有興趣？如果你只是覺得這些都是要背的雲端名詞，也把那個感覺如實記下來。這個專案除了教技術，也是在蒐集你對 Cloud Infrastructure 的真實反應。
