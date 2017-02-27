;;; timelineForm.el --- a form for entering into the timeline  -*- lexical-binding: t; -*-

;; Copyright (C) 2017  James P. Ascher

;; Author: James P. Ascher <james.ascher@gmail.com>
;; Commentary: clean interface for the forms

;;; Code:
(setq forms-file "timeline.csv")
(setq forms-number-of-fields 6)
(setq forms-read-only nil)
(setq forms-field-sep "\t")
(setq forms-multi-line "\^k")
(setq forms-insert-after t)

(setq forms-format-list
      (list
       "======== Timeline Entry ========\n\n"
       "Year : "    1
       "         "
       "Topic  : "    2
       "\nSouce : " 5
       "\nTags : " 6
       "\n\nNotes : "    3
       "\nExact Date : "    4
       ))

(defun csv-to-dsv-buffer ()
  (shell-command-on-region (point-min) (point-max)
                           "csvfix write_dsv -s \'\t\'" t t))
(setq forms-read-file-filter '(csv-to-dsv-buffer))

(defun dsv-to-csv-buffer ()
  (shell-command-on-region (point-min) (point-max)
                           "csvfix read_dsv -s \'\t\'" t t)
  nil)
(setq forms-write-file-filter 'dsv-to-csv-buffer)


;;; timelineForm.el ends here
