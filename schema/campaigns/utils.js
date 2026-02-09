export async function getFundist(item, context, query) {
  let fundistType = null;

  if (item.fundistDonationId) {
    fundistType = "Donation";
  } else if (item.fundistSignupId) {
    fundistType = "Signup";
  } else if (item.fundistBasicId) {
    fundistType = "Basic";
  }

  return [
    fundistType,
    fundistType &&
      (await context.query["Fundist" + fundistType].findOne({
        where: { id: item[`fundist${fundistType}Id`] },
        query: query,
      })),
  ];
}
