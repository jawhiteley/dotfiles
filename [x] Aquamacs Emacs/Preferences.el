;; This is the Aquamacs Preferences file.
;; Add Emacs-Lisp code here that should be executed whenever
;; you start Aquamacs Emacs. If errors occur, Aquamacs will stop
;; evaluating this file and print errors in the *Messags* buffer.
;; Use this file in place of ~/.emacs (which is loaded as well.)

; Useful packages =============================================
(setq viper-mode t)  ; enable viper-mode by default
(require 'viper)     ; viper-mode

; Formatting ==================================================
; word wrapping
(setq word-wrap t)   ; turn word-wrapping on.

; tabs & spaces __________
  ; I find the default, 8, is a bit excessive, but I actually prefer 2 for indenting.
(setq-default fill-column 80)
(setq-default indent-tabs-mode nil)     ; Use spaces instead of <TAB>s for indent.
(setq-default tab-width 4)              ; <TAB> chars are interpreted as 4 spaces.
(setq-default c-basic-offset 4)         ; basic indent is 4 spaces?
(setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80))  ; basic indent is mod-4 (the above doesn't work as expected).

; ESS-specific key bindings. Let's make them more Mac/GUI-like
(add-hook 'ess-mode-hook
  '(lambda ()
    ; Ideally, these would be the same keybinding, but would 
    ; evaluate if there was a region, and apply to that, 
    ; before applying to the current line.
    (define-key ess-mode-map [f5]               'ess-eval-line)
    (define-key ess-mode-map (kbd "M-<return>") 'ess-eval-line-and-step)
    (define-key ess-mode-map [f6]               'ess-eval-region)
    (define-key ess-mode-map (kbd "A-<return>") 'ess-eval-region)
   )
)
