;; Copyright 2024 Google LLC
;;
;; Licensed under the Apache License, Version 2.0 (the "License");
;; you may not use this file except in compliance with the License.
;; You may obtain a copy of the Licen
;;
;;     http://www.apache.org/licenses/LICENSE-2.0
;;
;; Unless required by applicable law or agreed to in writing, software
;; distributed under the License is distributed on an "AS IS" BASIS,
;; WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
;; See the License for the specific language governing permissions and
;; limitations under the License.

;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el
;;;

;; themes and vanity:
(package! base16-theme)
(package! catppuccin-theme)
(package! doom-themes)
(package! theme-magic)
(package! holo-layer
  :recipe  (:type git :host github :repo "manateelazycat/holo-layer"
            :files ("icon_cache" "plugin" "resources" "swaymsg-treefetch" "*.el" "*.py"))
  :pin "6584d8057a264f199e0cf6e90095fa63d36e6049")
(package! mac-plugin
  :recipe (:type git :host github :repo "happyo/EmacsMacPluginModule"
         :files ("Sources" "Tests" "*el" ".swift"))
  :pin "efddba283ad99581ba9adf346380ce3239acc5c2")

;; org extensions:
;;
(package! org)
(package! ob-mermaid)
(package! org-download)
(package! org-drawio)
(package! org-excalidraw
  :recipe (:type git :host github :repo "wdavew/org-excalidraw")
  :pin "9750463dfda28b9ca70df048761c131aa94d6c12")
(package! org-modern)
(package! org-present)
(package! org-roam)
(package! org-roam-ui)
(package! org-ros)
(package! org-super-agenda)
(package! org-transclusion)
(package! org-tree-slide)
(package! moom)
(package! org-xopp
  :recipe (:type git
           :repo "https://github.com/mahmoodsh36/org-xopp"
           :files (:defaults "*.sh"))
  :pin "cef73dd97d39a70dde8fbe5b5eeab3c42fed8f97")
 ;; :config
 ;; (org-xopp-setup))
 ;;
(package! org-xournalpp
  :recipe (:type git
           :repo "https://codeberg.org/Hermanhel/org-xournalpp.git"
           :files ("resources" "*.el"))
  :pin "3b1259240fe1b693fa49652270149762123358d6")

(package! org-yt
  :recipe (:type git
           :repo "https://github.com/TobiasZawada/org-yt"
           :files ("*.el"))
  :pin "56166f48e04d83668f70ed84706b7a4d8b1e5438")


;; other
(package! beacon)
(package! dotenv-mode)
(package! evil-escape :disable t)
(package! evil-tutor)
(package! key-chord)
(package! magit)
(package! olivetti)
(package! openwith)
(package! time-block)
(package! treemacs)
(package! treemacs-magit)
(package! treemacs-evil)
(package! treemacs-projectile)
(package! treemacs-persp)
(package! treemacs-tab-bar)
(package! lsp-treemacs)
(package! visual-fill-column)
