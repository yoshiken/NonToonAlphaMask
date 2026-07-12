# NonToon Alpha Mask

NonToon（lilxyzw製）にアルファマスク機能を追加する **Shader Core サードパーティモジュール**です。

照れ表情の頬染めなど、マスクで透過制御したいオーバーレイに使えます。

## 必要環境

- Unity 2022.3
- [Shader Core](https://github.com/lilxyzw/Shader-Core) **0.1.2 以上**
- [NonToon](https://github.com/lilxyzw/NonToon) 0.1.0

動作確認: Shader Core 0.1.2 / NonToon 0.1.0 / Unity 2022.3.22f1（VRChat SDK）

> Shader Core は開発初期のため、モジュール API が将来変わる可能性があります。

## 導入

### VPM（推奨）

1. VCC / ALCOM に VPM リポジトリを追加  
   `https://yoshiken.github.io/NonToonAlphaMask/vpm.json`
2. プロジェクトに **NonToon** と **NonToon Alpha Mask** をインストール

> NonToon は本パッケージの依存関係として自動インストールされません。

### 手動

[Releases](https://github.com/yoshiken/NonToonAlphaMask/releases) の zip を展開し、次の配置になるようにプロジェクトへ追加してください。

```text
Packages/jp.yoshiken.nontoon-alphamask/package.json
```

### モジュールの有効化（必須）

インストールしただけでは効きません。**Shader Core のモジュール一覧で有効化**してください。

1. NonToon マテリアルを選択
2. Inspector 上部の **「モジュールを選択」**（英語 UI では **Select Modules**）を開く
3. **Alpha Mask**（`jp.yoshiken.nontoon.alphamask`）にチェックを入れて **Apply**

設定は `ProjectSettings/jp.lilxyzw.shadercore.asset` に保存されます。有効化後、マテリアル Inspector に「アルファマスク」セクションが出ます。

## パラメータ

| 項目 | 説明 |
|---|---|
| Alpha Mask | マスクテクスチャ（メイン UV・**R チャンネル**、Tiling/Offset あり） |
| モード | 0=None / 1=置き換え / 2=乗算 / 3=加算 / 4=減算（デフォルト: None） |
| スケール | マスク強度 |
| オフセット | マスクオフセット |

```text
saturate(mask.r * Scale + Offset)
```

デフォルトのマスクは白です。置き換えモードを使う場合は、テクスチャ未設定だと全面不透明になるため、必ずマスクを割り当ててください。

### lilToon との対応

| lilToon プロパティ | Alpha Mask の項目 | 内容 |
|---|---|---|
| `_AlphaMask` | Alpha Mask | マスクテクスチャ |
| `_AlphaMaskMode` | モード | 0〜4（lilToon と同じ動作） |
| `_AlphaMaskScale` | スケール | マスク値の倍率 |
| `_AlphaMaskValue` | オフセット | マスク値への加算値 |
| `_AlphaMask_ST` | Tiling / Offset | メイン UV に対する変換 |

計算式とモード番号は lilToon と同じですが、マテリアル内の実際のプロパティ名には Shader Core により `_jp_yoshiken_nontoon_alphamask_` という接頭辞が付きます。既存の lilToon マテリアルから値が自動移行されるわけではないため、NonToon の Inspector で設定し直してください。

## 注意

- **レンダリングモードが不透明（Opaque）のマテリアルでは効果がありません。**  
  NonToon は不透明時にアルファを強制 1 にするため、カットアウト / 半透明で使ってください。
- モジュール有効化はプロジェクト単位です。有効化を変えたあと反映されない場合は `Packages/jp.lilxyzw.nontoon/Shaders/NonToon.scshader` を再インポートしてください。

## ライセンス

zlib License（Copyright 2026 yoshiken）

lilToon 由来部分のライセンスは [`Third Party Notices.md`](jp.yoshiken.nontoon-alphamask/Third%20Party%20Notices.md) を参照してください。

## メンテナー向け

1. `jp.yoshiken.nontoon-alphamask/package.json` の `version`（と `url`）を更新
2. commit & push
3. 同じバージョン文字列で tag を作成して push（以下は `1.0.1` の例）  
   `git tag 1.0.1 && git push origin 1.0.1`
4. GitHub Actions が Release と zip を作成
5. [`docs/vpm.json`](docs/vpm.json) にバージョンを追記
6. `docs/vpm.json` を commit & push し、VPM リポジトリへ反映
