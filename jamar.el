;;; jamar.el --- What's the math?

;; Copyright (C) 2013  Cliff Rodgers

;; Author: Cliff Rodgers <cliff.rodgers@gmail.com>
;; Keywords: news, calendar, games

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Yo, it's the GOD, GOD! This package, named after the great Lord
;; Jamar from Brand Nubian, provides functions to display the Supreme
;; Mathematics for the day.  The entry function can be called with M-x
;; jamar. See http://en.wikipedia.org/wiki/Nation_of_Gods_and_Earths
;; for more information.

;;; Code:

(require 's)


(defun smath-today ()
  "Return a formatted string describing today's supreme mathematics."
  (let ((day (format-time-string "%d")))
    (cond ((equal (length day) 2)
	   (let* ((left (s-left 1 day))
		  (right (s-right 1 day))
		  (abbt (number-to-string (+ (string-to-number left)
					     (string-to-number right)))))
	     (cond ((> (string-to-number abbt) 9)
		    (let ((abbt-left (s-left 1 abbt))
			  (abbt-right (s-right 1 abbt)))
		      (format "Today's math is %s %s all being born to %s add %s all being born to %s"
			      (smath-lookup left)
			      (smath-lookup right)
			      (smath-lookup abbt-left)
			      (smath-lookup abbt-right)
			      (smath-lookup abbt-left))))
		   (t
		    (format "Today's math is %s %s all being born to %s"
			    (smath-lookup left)
			    (smath-lookup right)
			    (smath-lookup abbt))))))
	   (t
	    (format "Today's math is %s"
		    (smath-lookup day))))))

(defun smath-lookup (num-string)
  "A lookup table for the numerology of the supreme mathematics."
  (cond ((equal num-string "0") "CIPHER")
	((equal num-string "1") "KNOWLEDGE")
	((equal num-string "2") "WISDOM")
	((equal num-string "3") "UNDERSTANDING")
	((equal num-string "4") "CULTURE/FREEDOM")
	((equal num-string "5") "POWER/REFINEMENT")
	((equal num-string "6") "EQUALITY")
	((equal num-string "7") "GOD")
	((equal num-string "8") "BUILD/DESTROY")
	((equal num-string "9") "BORN")))

(defun jamar ()
  "Much love to Lord Jamar from Brand Nubian.  See `smath-today'
for the inner-workings of this function."
  (interactive)
  (message "%s. %s."
	   (smath-greeting)
	   (smath-today)))


(defun smath-random-choice (list)
  "Returns a random item from LIST."
  (nth (random (length list)) list))

(defun smath-greeting ()
  "Return a random Five Percenter greeting."
  (smath-random-choice '("Peace, GOD"
			 "Bong bong"
			 "It\'s the GOD, GOD"
			 "Word is bond"
			 "Peace"
			 "Peace peace"
			 "Yo")))

(provide 'jamar)
;;; jamar.el ends here
