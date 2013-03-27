;;;; .emacs by KURATA

;;; 環境毎の設定

;; 初期ディレクトリの設定
;(cd "I:/home/clutter")

;; load-pathに追加するフォルダ
;(setq load-path (append
;		 '("~/.emacs.d"
;		   "~/.emacs.d/elisp")
;		 load-path))

;;; 透明
;(set-alpha '(85 50))

;;; カラー
;(require 'color-theme)
;(color-theme-initialize)
;(color-theme-lawrence)

;;; スタートアップ非表示
(setq inhibit-startup-screen t)

;;; 初期フレームの設定
;(setq initial-frame-alist
;      (append
;       '((top                 . 12)    ; フレームの Y 位置(ピクセル数)
;	 (left                . 800)   ; フレームの X 位置(ピクセル数)
;	 (width               . 101)    ; フレーム幅(文字数)
;	 (height              . 60))   ; フレーム高(文字数)
;       initial-frame-alist))

;;; 新規フレームのデフォルト設定
;(setq default-frame-alist
;      (append
;       '((width               . 81)	; フレーム幅(文字数)
;	 (height              . 50))	; フレーム高(文字数)	
;       default-frame-alist))

;;; ツールバー非表示
(tool-bar-mode 0)

;;; ファイルのフルパスをタイトルバーに表示
(setq frame-title-format
      (format "%%f - Emacs@%s" (system-name)))

;;; モードライン
;; 時刻表示
(display-time-mode 1)
;; カーソル位置の行列の表示
(line-number-mode 1)
(column-number-mode 1)
;; 行番号の表示
(require 'linum)
(global-linum-mode t)

;;; 最近使ったファイルをメニューに表示
;(recentf-mode 1)
;(setq recentf-max-menu-items 10)
;(setq recentf-max-saved-items 10)

;;; 日本語環境の設定
;(set-language-environment "Japanese")
;(set-default-coding-systems 'euc-japan)
;(set-terminal-coding-system 'euc-japan)
;;; Localeに合わせた環境の設定
;(set-locale-environment nil)

;;; バックアップを残さない
(setq make-backup-files nil)

;;; 終了時にオートセーブファイルを消す
(setq delete-auto-save-files t)

;; 改行キーでオートインデント
(global-set-key "\C-m" 'newline-and-indent)
(global-set-key "\C-j" 'newline)

;;; スクロールを一行ずつにする
;;(setq scroll-step 1) こいつだめ

;;; キーバインド
(define-key global-map "\C-h" 'delete-backward-char) ; 削除
(define-key global-map "\M-?" 'help-for-help)        ; ヘルプ
(define-key global-map "\C-ci" 'indent-region)       ; インデント
(define-key global-map "\C-c\C-i" 'dabbrev-expand)   ; 補完
(define-key global-map "\C-c;" 'comment-region)      ; コメントアウト
(define-key global-map "\C-c:" 'uncomment-region)    ; コメント解除
(define-key global-map "\C-o" 'toggle-input-method)  ; 日本語入力切替

;;;; expand
;;; auto-install.el
;; (require 'auto-install)
;; (setq auto-install-directory "~/.emacs.d/elisp/")
;; (auto-install-update-emacswiki-package-name t)
;; (auto-install-compatibility-setup)             ; 互換性確保

;;; YaTeX
;(add-to-list 'load-path "~/.emacs.d/site-lisp/yatex/")
;(add-to-list 'load-path "~/.emacs.d/elisp/yatex/")
;(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)
;(setq auto-mode-alist
      (append
       '(
         ("\\.tex$" . yatex-mode)
         ("\\.ltx$" . yatex-mode)
         ("\\.cls$" . yatex-mode)
         ("\\.sty$" . yatex-mode)
         ("\\.clo$" . yatex-mode)
         ("\\.bbl$" . yatex-mode)
         ) auto-mode-alist))
;(setq YaTeX-inhibit-prefix-letter t)
;(setq YaTeX-kanji-code nil)
;(setq tex-command "pdfplatex.bat")
;(setq bibtex-command "pbibtex")
;(setq makeindex-command "mendex")
;(setq dviprint-command-format "pdfopen --file %s")
;(setq YaTeX-dvipdf-command "dvipdfmx")
;(setq dvi2-command "C:/w32tex/share/texworks/TeXworks")
;(setq dvi2-command "C:/dviout/dviout.exe")
;(setq YaTeX-dvi2-command-ext-alist
; '(("dviout" . ".dvi")
;   ("gsview32\\|psv" . ".ps")
;   ("TeXworks\\|SumatraPDF\\|AcroRd32\\|pdfopen" . ".pdf")))

;;; c-mode, c++-mode
(add-hook 'c-mode-common-hook
          '(lambda ()
             ;;; K&R のスタイルを使う
             (c-set-style "k&r")
             ;;; インデントには tab を使う
             (setq indent-tabs-mode t)
             ;;; インデント幅
             (setq c-basic-offset 4)
             ))

(setq auto-mode-alist
      ;;; 拡張子とモードの対応
      (append
       '(("\\.c$" . c-mode))
       '(("\\.h$" . c-mode))
       '(("\\.cpp$" . c++-mode))
       auto-mode-alist))