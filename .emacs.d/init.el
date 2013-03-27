;;;; .emacs by KURATA

;;; ----------------------------------------------------------------------------
;;; ファイル構成
;;; *Emacs実践入門p58参考
;;; ----------------------------------------------------------------------------
;; ~/.emacs.d
;;  - init.el	設定ファイル(本ファイル)
;;  - conf	分割設定用ディレクトリ
;;  - elisp	Elispインストールディレクトリ
;;  - elpa	ELPA用のディレクトリ
;;  - public_repos	公開リポジトリから拡張機能をcheckoutするdir
;;  - etc	etc用ディレクトリ
;;  - info	infoファイル用ディレクトリ
;;  - その他のディレクトリ


;;; ----------------------------------------------------------------------------
;;; ロードパスの追加
;;; ----------------------------------------------------------------------------

;; load-pathを追加する関数
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory
	      (expand-file-name (concat user-emacs-directory path))))
	(add-to-list 'load-path default-directory)
	(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
	    (normal-top-level-add-subdirs-to-load-path))))))

;; 引数のディレクトリとそのサブディレクトリをload-pathに追加
(add-to-load-path "elisp" "conf" "public_repos")

;;; ----------------------------------------------------------------------------
;;; 言語設定
;;; ----------------------------------------------------------------------------

;; 言語を日本語にする
(set-language-environment 'Japanese)
;; 文字コードをUTF-8にする
(prefer-coding-system 'utf-8)

;;; ----------------------------------------------------------------------------
;;; キーバインド
;;; ----------------------------------------------------------------------------

;; 基本
(define-key global-map "\C-h" 'delete-backward-char) ; 削除
(define-key global-map "\M-?" 'help-for-help)        ; ヘルプ
(define-key global-map "\C-ci" 'indent-region)       ; インデント
(define-key global-map "\C-c\C-i" 'dabbrev-expand)   ; 補完
(define-key global-map "\C-c;" 'comment-region)      ; コメントアウト
(define-key global-map "\C-c:" 'uncomment-region)    ; コメント解除
(define-key global-map "\C-o" 'toggle-input-method)  ; 日本語入力切替

;; 改行キーでオートインデント
(global-set-key "\C-m" 'newline-and-indent)
(global-set-key "\C-j" 'newline)

;;; ----------------------------------------------------------------------------
;;; モードライン
;;; ----------------------------------------------------------------------------

;; 時刻表示
(display-time-mode 1)
;; カーソル位置の行列の表示
(line-number-mode 1)
(column-number-mode 1)
;; 行番号の表示
(require 'linum)
(global-linum-mode t)

;;; ----------------------------------------------------------------------------
;;; 色々な設定
;;; ----------------------------------------------------------------------------

;; スタートアップ非表示
(setq inhibit-startup-screen t)

;; ツールバー非表示
(tool-bar-mode 0)	; ubuntu12.04にて動作しない

;; ファイルのフルパスをタイトルバーに表示
(setq frame-title-format
      (format "%%f - Emacs@%s" (system-name)))

;; バックアップを残さない
(setq make-backup-files nil)

;; 終了時にオートセーブファイルを消す
(setq delete-auto-save-files t)

;;; ----------------------------------------------------------------------------
;;; モード設定
;;; ----------------------------------------------------------------------------

;; c-mode, c++-mode
(add-hook 'c-mode-common-hook
          '(lambda ()
             ;; K&R のスタイルを使う
             (c-set-style "k&r")
             ;; インデントには tab を使う
             (setq indent-tabs-mode t)
             ;; インデント幅
             (setq c-basic-offset 4)
             ))

(setq auto-mode-alist
      ;; 拡張子とモードの対応
      (append
       '(("\\.c$" . c-mode))
       '(("\\.h$" . c-mode))
       '(("\\.cpp$" . c++-mode))
       auto-mode-alist))

;;; ----------------------------------------------------------------------------
;;; 環境毎の設定
;;; ----------------------------------------------------------------------------

;; IMEの設定

;;; ----------------------------------------------------------------------------
;;; メモ
;;; ----------------------------------------------------------------------------

;; 透明
;(set-alpha '(85 50))

;; カラー
;(require 'color-theme)
;(color-theme-initialize)
;(color-theme-lawrence)
