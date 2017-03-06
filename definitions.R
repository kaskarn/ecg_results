studies = c("ARIC", "WHI_Whites", "mega", "metal")
substudies = list(ARIC = c("aric_b", "aric_w"), WHI_Whites = c("GARNET", "GECCO", "HIPFX", "MOPMAP", "WHIMS"), 
                  mega = "", metal = "")
traits = c("pwav", "pr_seg", "qrs", "st", "twav", "tp")
traitslab = list(pwav = "P-wave", pr_seg = "PR Segment", qrs = "QRS Interval", st = "ST Segment", twav = "T-wave", tp = "TP Segment")
prefix = list(ARIC="ARIC_", WHI_Whites = "", mega = "mega_", metal = "")
fixt = list(mega = "SOL + Share", metal = "Meta-Analysis")
annolist <- list(multicolor=1, any=2, PR=3,
                 QRS=4, QT=5, RR=6)