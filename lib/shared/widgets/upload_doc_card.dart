import 'all_package.dart';

class UploadedDocument extends StatelessWidget {
  const UploadedDocument({Key? key, this.fileName="Prestige bill.pdf", this.onRemove}) : super(key: key);
  final String fileName;
  final Function()? onRemove;

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 327,
      // height: 128.h,
      margin: EdgeInsets.only(bottom: 8.h),
      padding: EdgeInsets.all(16.r),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1.w, color: AppColors.white3),
          borderRadius: BorderRadius.circular(12),
        ),
        shadows: [
          BoxShadow(
            color: AppColors.grey4,
            blurRadius: 2.sp,
            offset: Offset(0, 1.w),
            spreadRadius: 0,
          )
        ],
      ),
      child: Container(
        // height: 96,
        padding: EdgeInsets.all(12.r),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1.w, color: AppColors.aqua),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(SvgAssets.file),
                WSpace(14.w),
                Expanded(flex: 2, child: Styles.regular(fileName, overflow: TextOverflow.ellipsis,color: AppColors.blackText, fontSize: 16.sp, fontWeight: FontWeight.w500)),
                WSpace(14.w),
                const SizedBox()
              ],
            ),
            InkWell(
              onTap: onRemove,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Styles.regular("Remove", color: AppColors.red, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
