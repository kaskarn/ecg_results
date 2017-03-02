studies = c("ARIC", "WHI_Whites", "mega", "metal")
substudies = list(ARIC = c("b", "w"), WHI_Whites = c("GARNET", "GECCO", "HIPFX", "MOPMAP", "WHIMS"), 
                  mega = "", metal = "")
traits = c("pwav", "pr_seg", "qrs", "st", "twav", "tp")
prefix = list(ARIC="ARIC_", WHI_Whites = "", mega = "mega_", metal = "")
fixt = list(mega = "SOL + Share", metal = "Meta-Analysis")