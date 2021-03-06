! Copyright (c) 2000, NVIDIA CORPORATION.  All rights reserved.
!
! Licensed under the Apache License, Version 2.0 (the "License");
! you may not use this file except in compliance with the License.
! You may obtain a copy of the License at
!
!     http://www.apache.org/licenses/LICENSE-2.0
!
! Unless required by applicable law or agreed to in writing, software
! distributed under the License is distributed on an "AS IS" BASIS,
! WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
! See the License for the specific language governing permissions and
! limitations under the License.

!   Initialization expressions containing PARAMETER references

    MODULE d00dat_9d
      INTEGER, PARAMETER :: wp = KIND(1.0D0)
      REAL (wp), PARAMETER :: temp_wt1(64) = (/ 0.5555555555555556_wp, &
       0.8888888888888889_wp, 0.2684880898683334_wp, 0.1046562260264673_wp, &
       0.4013974147759622_wp, 0.4509165386584741_wp, 0.1344152552437842_wp, &
       0.05160328299707974_wp, 0.2006285293769890_wp, 0.01700171962994026_wp, &
       0.09292719531512454_wp, 0.1715119091363914_wp, 0.2191568584015875_wp, &
       0.2255104997982067_wp, 0.06720775429599070_wp, 0.02580759809617665_wp, &
       0.1003142786117956_wp, 0.008434565739321106_wp, 0.04646289326175799_wp, &
       0.08575592004999035_wp, 0.1095784210559246_wp, 0.002544780791561874_wp, &
       0.01644604985438781_wp, 0.03595710330712932_wp, 0.05697950949412336_wp, &
       0.07687962049900353_wp, 0.09362710998126447_wp, 0.1056698935802348_wp, &
       0.1119568730209535_wp, 0.1127552567207687_wp, 0.03360387714820773_wp, &
       0.01290380010035127_wp, 0.05015713930589954_wp, &
       0.004217630441558855_wp, 0.02323144663991027_wp, &
       0.04287796002500773_wp, 0.05478921052796287_wp, &
       0.001265156556230068_wp, 0.008223007957235930_wp, &
       0.01797855156812827_wp, 0.02848975474583355_wp, 0.03843981024945553_wp, &
       0.04681355499062801_wp, 0.05283494679011652_wp, 0.05597843651047632_wp, &
       0.3632214818455307E-03_wp, 0.002579049794685688_wp, &
       0.006115506822117246_wp, 0.01049824690962132_wp, &
       0.01540675046655950_wp, 0.02059423391591271_wp, 0.02586967932721475_wp, &
       0.03107355111168796_wp, 0.03606443278078257_wp, 0.04071551011694432_wp, &
       0.04491453165363220_wp, 0.04856433040667320_wp, 0.05158325395204846_wp, &
       0.05390549933526606_wp, 0.05548140435655936_wp, 0.05627769983125430_wp, &
       0.05637762836038472_wp, 0.01680193857410387_wp, &
       0.006451900050175737_wp/)
      REAL (wp), PARAMETER :: wt_dp(32) = (/ temp_wt1(2::2) /)
    END MODULE d00dat_9d

	use d00dat_9d
	real(wp) ::expect(32)
	expect = temp_wt1(2::2)
	call check(wt_dp, expect,32)
	end
